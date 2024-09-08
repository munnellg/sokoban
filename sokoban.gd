extends Node2D

###############################################################################
# PRIVATE METHODS
###############################################################################

func _ready():
	# disable in-game controls
	%Gameplay.pause()
	%MainMenu.show()
	
func _init_map(map_id: int):
	%Gameplay.current_level = map_id
	%MainMenu.show_resume_button(%Gameplay.map_loaded)

func _return_to_game():
	%MainMenu.hide_panel_contents()
	%MainMenu.hide()
	%Gameplay.unpause()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _background_game():
	%Gameplay.pause()
	%HideMouseTimer.stop()
	
func _toggle_main_menu():
	%MainMenu.visible = not %MainMenu.visible
	if not %MainMenu.visible:
		_return_to_game()
	else:
		_background_game()
		
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel") and %Gameplay.map_loaded:
		_toggle_main_menu()
		
	if Input.get_last_mouse_velocity().length() > 0:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if not %Gameplay.paused:
			%HideMouseTimer.start()
	
	if %Gameplay.paused:
		%HideMouseTimer.stop()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

###############################################################################
# PUBLIC METHODS
###############################################################################

func update_save_file():
	GameState.save_game(%Gameplay)
	%MainMenu.update_level_state(GameState.savegame.current_level)
	%MainMenu.update_level_state(%Gameplay.current_level)

###############################################################################
# SIGNALS
###############################################################################

func _on_main_menu_level_selected(map_id):
	_init_map(map_id)
	_return_to_game()

func _on_main_menu_level_resumed():
	_return_to_game()

func _on_hide_mouse_timer_timeout():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_gameplay_level_finished() -> void:
	update_save_file()

func _on_gameplay_level_initialized() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	%HideMouseTimer.start()
