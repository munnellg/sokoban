extends Node2D

@onready var main_menu      = $MainMenuLayer/MainMenu
@onready var environment    = $Environment
@onready var level_finished = $LevelFinishedLayer/LevelFinished

func _ready():
	# disable in-game controls
	environment.set_process(false)
	main_menu.show()
	level_finished.hide()

func _init_map(map_id: int):
	environment.map_id = map_id
	environment.init_map()
	main_menu.show_resume_button(environment.map_loaded)

func _return_to_game():
	main_menu.hide_panel_contents()
	main_menu.hide()	
	level_finished.hide()
	environment.set_process(true)

func _background_game():
	environment.set_process(false)
	
func _toggle_main_menu():
	main_menu.visible = not main_menu.visible
	if not main_menu.visible:
		_return_to_game()
		
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and environment.map_loaded:
		_toggle_main_menu()

func _on_environment_level_finished():
	_background_game()
	level_finished.show()

func _on_main_menu_level_selected(map_id):
	_init_map(map_id)
	_return_to_game()

func _on_level_finished_next_level_pressed():
	_init_map(environment.map_id + 1)
	_return_to_game()

func _on_main_menu_level_resumed():
	_return_to_game()

func _on_level_finished_retry_level_pressed():
	_init_map(environment.map_id)
	_return_to_game()

func _on_master_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
	
func _on_music_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(value))

func _on_sfx_volume_slider_value_changed(value):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), linear_to_db(value))
