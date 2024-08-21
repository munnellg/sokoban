extends Control

@onready var level_list = $HBoxContainer/Sections/Play/VBoxContainer/ScrollContainer/VBoxContainer

@onready var master_volume_slider = $HBoxContainer/Sections/Options/VBoxContainer/AudioArea/VBoxContainer/HBoxContainer/MasterVolumeSlider
@onready var sfx_volume_slider    = $HBoxContainer/Sections/Options/VBoxContainer/AudioArea/VBoxContainer/HBoxContainer3/SfxVolumeSlider
@onready var music_volume_slider  = $HBoxContainer/Sections/Options/VBoxContainer/AudioArea/VBoxContainer/HBoxContainer2/MusicVolumeSlider

@onready var resolution_options        = $HBoxContainer/Sections/Options/VBoxContainer/GraphicsArea/VBoxContainer/HBoxContainer/ResolutionOptionButton
@onready var fullscreen_checkbox       = $HBoxContainer/Sections/Options/VBoxContainer/GraphicsArea/VBoxContainer/FullscreenCheckbox
@onready var accessible_fonts_checkbox = $HBoxContainer/Sections/Options/VBoxContainer/GraphicsArea/VBoxContainer/AccessibleFontsCheckbox

@onready var quit_button = $HBoxContainer/VBoxContainer/Main/VBoxContainer/QuitButton

const LevelSelect = preload("res://level_select/level_select.tscn")
const maps        = preload("res://levels/maps.json").maps

const default_theme     = preload("res://kenny_theme/kenny_theme.tres")
const default_font      = preload("res://kenny_theme/assets/fonts/OpenDyslexic-Regular.otf")
const inaccessible_font = preload("res://kenny_theme/assets/fonts/montserrat_extra_bold.otf")

signal level_selected(map_id: int)
signal level_resumed

func _ready():
	$HBoxContainer/Sections.hide()
	
	# hide quit button if we're running in a web browser
	quit_button.visible = not OS.has_feature("web")
	
	for i in range(maps.size()):
		var level_select = LevelSelect.instantiate()
		level_select.title = maps[i].title
		level_select.description = maps[i].description
		level_select.level_id = i
		level_select.level_selected.connect(_on_level_selected)
		level_list.add_child(level_select)
	
	var audio_settings = ConfigFileLoader.load_audio_settings()
	master_volume_slider.value = audio_settings[ConfigFileLoader.VOLUME_MASTER]
	music_volume_slider.value  = audio_settings[ConfigFileLoader.VOLUME_MUSIC]
	sfx_volume_slider.value    = audio_settings[ConfigFileLoader.VOLUME_SFX]
	
	var graphics_settings = ConfigFileLoader.load_graphics_settings()
	fullscreen_checkbox.button_pressed       = graphics_settings[ConfigFileLoader.GFX_FULLSCREEN]
	accessible_fonts_checkbox.button_pressed = graphics_settings[ConfigFileLoader.GFX_USE_ACCESSIBLE_FONTS]
	
	for i in range(resolution_options.get_item_count()):
		if resolution_options.get_item_text(i) == graphics_settings[ConfigFileLoader.GFX_RESOLUTION]:
			resolution_options.selected = i
			break
			
func hide_panel_contents():
	$HBoxContainer/Sections.hide()

func _on_play_button_pressed():
	$HBoxContainer/Sections/Options.hide()
	$HBoxContainer/Sections/Credits.hide()
	
	if $HBoxContainer/Sections/Play.is_visible_in_tree():
		$HBoxContainer/Sections/Play.hide()
		$HBoxContainer/Sections.hide()
	else:
		$HBoxContainer/Sections/Play.show()
		$HBoxContainer/Sections.show()

func _on_options_button_pressed():
	$HBoxContainer/Sections/Play.hide()
	$HBoxContainer/Sections/Credits.hide()
	
	if $HBoxContainer/Sections/Options.is_visible_in_tree():
		$HBoxContainer/Sections/Options.hide()
		$HBoxContainer/Sections.hide()
	else:
		$HBoxContainer/Sections/Options.show()
		$HBoxContainer/Sections.show()
	
func _on_credits_button_pressed():
	$HBoxContainer/Sections/Play.hide()
	$HBoxContainer/Sections/Options.hide()
	
	if $HBoxContainer/Sections/Credits.is_visible_in_tree():
		$HBoxContainer/Sections/Credits.hide()
		$HBoxContainer/Sections.hide()
	else:
		$HBoxContainer/Sections/Credits.show()
		$HBoxContainer/Sections.show()

func show_resume_button(show: bool):
	$HBoxContainer/VBoxContainer/Main/VBoxContainer/ResumeButton.visible = show

func _on_level_selected(map_id: int):
	level_selected.emit(map_id)

func _on_resume_button_pressed():
	level_resumed.emit()
	
func _on_quit_button_pressed():
	get_tree().quit()

func _on_master_volume_slider_drag_ended(value_changed):
	if value_changed:
		ConfigFileLoader.save_audio_settings(ConfigFileLoader.VOLUME_MASTER, master_volume_slider.value)

func _on_music_volume_slider_drag_ended(value_changed):
	if value_changed:
		ConfigFileLoader.save_audio_settings(ConfigFileLoader.VOLUME_MUSIC, music_volume_slider.value)

func _on_sfx_volume_slider_drag_ended(value_changed):
	if value_changed:
		ConfigFileLoader.save_audio_settings(ConfigFileLoader.VOLUME_SFX, sfx_volume_slider.value)

func _on_resolution_option_button_item_selected(index):
	ConfigFileLoader.update_resolution(resolution_options.get_item_text(index))
	ConfigFileLoader.save_graphics_settings(ConfigFileLoader.GFX_RESOLUTION, resolution_options.get_item_text(index))
	
func _on_fullscreen_checkbox_toggled(toggled_on):
	ConfigFileLoader.update_fullscreen(toggled_on)
	ConfigFileLoader.save_graphics_settings(ConfigFileLoader.GFX_FULLSCREEN, toggled_on)
	
func _on_accessible_fonts_checkbox_toggled(toggled_on):
	ConfigFileLoader.update_theme_accessibility(toggled_on)
	ConfigFileLoader.save_graphics_settings(ConfigFileLoader.GFX_USE_ACCESSIBLE_FONTS, toggled_on)

func _on_master_volume_slider_value_changed(value):
	ConfigFileLoader.update_master_volume(value)
	
func _on_music_volume_slider_value_changed(value):
	ConfigFileLoader.update_music_volume(value)

func _on_sfx_volume_slider_value_changed(value):
	ConfigFileLoader.update_sfx_volume(value)
