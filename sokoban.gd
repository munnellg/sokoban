extends Node2D

@onready var main_menu      = $MainMenuLayer/MainMenu
@onready var environment    = $Environment
@onready var level_finished = $LevelFinishedLayer/LevelFinished

func _ready():
	# disable in-game controls
	environment.pause()
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
	environment.unpause()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _background_game():
	environment.pause()
	$HideMouseTimer.stop()
	
func _toggle_main_menu():
	main_menu.visible = not main_menu.visible
	if not main_menu.visible:
		_return_to_game()
	else:
		environment.pause()
		
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and environment.map_loaded:
		_toggle_main_menu()
		
	if Input.get_last_mouse_velocity().length() > 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if environment.is_processing():
			$HideMouseTimer.start()
	
	if not environment.is_processing():
		$HideMouseTimer.stop()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func update_save_file():
	if environment.map_id >= GameState.savegame.current_level:
		GameState.savegame.current_level = environment.map_id + 1
		main_menu.update_level_state(GameState.savegame.current_level)
		
	environment.update_level_stats()
	main_menu.update_level_state(environment.map_id)
	GameState.save()

func _on_environment_level_finished():
	_background_game()
	update_save_file()
	level_finished.set_solved_moves(environment.moves)
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

func _on_hide_mouse_timer_timeout():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _adjust_camera_zoom(map_size: Vector2):
	# want a margin of one tile around the border, plus the height of the toolbar at the top of the screen
	var toolbar_size = $Environment/CanvasLayer/LevelStats.size
	var tile_size = Vector2($Environment.tile_set.tile_size)
	var margin_size = tile_size * 2 + Vector2(0, toolbar_size.y)
	var vp_size = get_viewport().get_visible_rect().size - margin_size
	var scale = vp_size / map_size
	scale = min(min(scale.x, scale.y), 1.0)
	$Viewport.set_zoom(Vector2(scale, scale))
		
	var centre_shift = (Vector2i(map_size / tile_size) % 2) * (Vector2i(tile_size) / 2)
	print((vp_size - map_size) / 2)
	print(-(centre_shift + Vector2i(0, toolbar_size.y / 2)))
	$Viewport.position = -(centre_shift + Vector2i(0, toolbar_size.y / 2))
	$Viewport.position = (vp_size - map_size) / 2
	
func _on_environment_level_initialized(size):	
	_adjust_camera_zoom(size)
