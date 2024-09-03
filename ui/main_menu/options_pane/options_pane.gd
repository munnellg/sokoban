extends Control

func _ready():
	var audio_settings = Configuration.load_audio_settings()
	%MasterVolumeSlider.value = audio_settings[Configuration.VOLUME_MASTER]
	%MusicVolumeSlider.value  = audio_settings[Configuration.VOLUME_MUSIC]
	%SfxVolumeSlider.value    = audio_settings[Configuration.VOLUME_SFX]
	
	var graphics_settings = Configuration.load_graphics_settings()
	%FullscreenCheckbox.button_pressed       = graphics_settings[Configuration.GFX_FULLSCREEN]
	%AccessibleFontsCheckbox.button_pressed = graphics_settings[Configuration.GFX_USE_ACCESSIBLE_FONTS]
	
	for i in range(%ResolutionOptionButton.get_item_count()):
		if %ResolutionOptionButton.get_item_text(i) == graphics_settings[Configuration.GFX_RESOLUTION]:
			%ResolutionOptionButton.selected = i
			break

func _on_master_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Configuration.save_audio_settings(Configuration.VOLUME_MASTER, %MasterVolumeSlider.value)

func _on_music_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Configuration.save_audio_settings(Configuration.VOLUME_MUSIC, %MusicVolumeSlider.value)

func _on_sfx_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Configuration.save_audio_settings(Configuration.VOLUME_SFX, %SfxVolumeSlider.value)

func _on_resolution_option_button_item_selected(index: int) -> void:
	Configuration.update_resolution(%ResolutionOptionButton.get_item_text(index))
	Configuration.save_graphics_settings(Configuration.GFX_RESOLUTION, %ResolutionOptionButton.get_item_text(index))
	
func _on_fullscreen_checkbox_toggled(toggled_on: bool) -> void:
	Configuration.update_fullscreen(toggled_on)
	Configuration.save_graphics_settings(Configuration.GFX_FULLSCREEN, toggled_on)
	
func _on_accessible_fonts_checkbox_toggled(toggled_on: bool) -> void:
	Configuration.update_theme_accessibility(toggled_on)
	Configuration.save_graphics_settings(Configuration.GFX_USE_ACCESSIBLE_FONTS, toggled_on)

func _on_master_volume_slider_value_changed(value: float) -> void:
	Configuration.update_master_volume(value)
	
func _on_music_volume_slider_value_changed(value: float) -> void:
	Configuration.update_music_volume(value)

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	Configuration.update_sfx_volume(value)
