extends Node

var config := ConfigFile.new()
const SETTINGS_FILENAME: String = "user://settings.ini"

const SECTION_AUDIO: String = "audio"
const VOLUME_MASTER: String = "volume_master"
const VOLUME_MUSIC: String  = "volume_music"
const VOLUME_SFX: String    = "volume_sfx"

const SECTION_GRAPHICS: String = "graphics"
const GFX_RESOLUTION: String = "gfx_resolution"
const GFX_FULLSCREEN: String = "gfx_fullscreen"
const GFX_USE_ACCESSIBLE_FONTS: String = "gfx_use_accessible_fonts"

const default_theme     = preload("res://kenny_theme/kenny_theme.tres")
const default_font      = preload("res://kenny_theme/assets/fonts/OpenDyslexic-Regular.otf")
const inaccessible_font = preload("res://kenny_theme/assets/fonts/montserrat_extra_bold.otf")

func _ready():
	if !FileAccess.file_exists(SETTINGS_FILENAME):
		config.set_value(SECTION_AUDIO, VOLUME_MASTER, 0.5)
		config.set_value(SECTION_AUDIO, VOLUME_MUSIC, 0.5)
		config.set_value(SECTION_AUDIO, VOLUME_SFX, 0.5)
		
		config.set_value(SECTION_GRAPHICS, GFX_RESOLUTION, "1920x1080")
		config.set_value(SECTION_GRAPHICS, GFX_FULLSCREEN, false)
		config.set_value(SECTION_GRAPHICS, GFX_USE_ACCESSIBLE_FONTS, true)
		
		config.save(SETTINGS_FILENAME)
	else:
		config.load(SETTINGS_FILENAME)
	
	apply_settings()

func save_graphics_settings(key: String, value):
	config.set_value(SECTION_GRAPHICS, key, value)
	config.save(SETTINGS_FILENAME)
	
func load_graphics_settings():
	var graphics_settings = {}
	for key in config.get_section_keys(SECTION_GRAPHICS):
		graphics_settings[key] = config.get_value(SECTION_GRAPHICS, key)
	return graphics_settings
	
func save_audio_settings(key: String, value):
	config.set_value(SECTION_AUDIO, key, value)
	config.save(SETTINGS_FILENAME)

func apply_settings():
	update_master_volume(config.get_value(SECTION_AUDIO, VOLUME_MASTER))
	update_music_volume(config.get_value(SECTION_AUDIO, VOLUME_MUSIC))
	update_sfx_volume(config.get_value(SECTION_AUDIO, VOLUME_SFX))
	
	update_resolution(config.get_value(SECTION_GRAPHICS, GFX_RESOLUTION))
	update_fullscreen(config.get_value(SECTION_GRAPHICS, GFX_FULLSCREEN))
	
	update_theme_accessibility(config.get_value(SECTION_GRAPHICS, GFX_USE_ACCESSIBLE_FONTS))

func load_audio_settings():
	var audio_settings = {}
	for key in config.get_section_keys(SECTION_AUDIO):
		audio_settings[key] = config.get_value(SECTION_AUDIO, key)
	return audio_settings

func centre_window():
	var primary_display_index = DisplayServer.get_primary_screen()
	var screen_size = DisplayServer.screen_get_size(primary_display_index)
	var window_size = DisplayServer.window_get_size()
	var center_position = (screen_size - window_size) / 2
	var display_position = DisplayServer.screen_get_position(primary_display_index)
	center_position += display_position
	DisplayServer.window_set_position(center_position)

func update_resolution(resolution_str: String):
	var resolution = resolution_str.split("x")
	DisplayServer.window_set_size(Vector2(int(resolution[0]), int(resolution[1])))
	centre_window()

func update_fullscreen(fullscreen: bool):
	var mode := DisplayServer.WINDOW_MODE_FULLSCREEN if fullscreen else DisplayServer.WINDOW_MODE_WINDOWED 
	DisplayServer.window_set_mode(mode)
	
	# if the resolution changed while in fullscreen, we may need
	# to update the resolution again when we switch back to windowed
	if not fullscreen:
		update_resolution(config.get_value(SECTION_GRAPHICS, GFX_RESOLUTION))

func update_master_volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	
func update_music_volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))

func update_sfx_volume(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear_to_db(value))
	
func update_theme_accessibility(apply_default: bool):
	default_theme.set_font("font", "Label", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "Button", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "Option", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "CheckBox", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "HeaderLarge", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "HeaderMedium", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "HeaderSmall", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "LoudLabel", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "OptionButton", default_font if apply_default else inaccessible_font)
	default_theme.set_font("font", "PopupMenu", default_font if apply_default else inaccessible_font)
