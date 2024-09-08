extends Control

signal level_selected(map_id: int)
signal level_resumed

###############################################################################
# PRIVATE METHODS
###############################################################################

func _ready() -> void:
	%MainMenuSections.hide()
	
	# hide quit button if we're running in a web browser
	%QuitButton.visible = not OS.has_feature("web")

func _toggle_visible_tab(tab_id: int) -> void:
	if %MainMenuSections.visible and tab_id == %MainMenuSections.current_tab:
		%MainMenuSections.hide()
	else:
		%MainMenuSections.current_tab = tab_id
		%MainMenuSections.show()

###############################################################################
# PUBLIC METHODS
###############################################################################

func hide_panel_contents() -> void:
	%MainMenuSections.hide()

func show_resume_button(visibility: bool) -> void:
	%ResumeButton.visible = visibility

func update_level_state(map_id: int) -> void:
	%PlayPane.update_level_state(map_id)

###############################################################################
# SIGNALS
###############################################################################

func _on_play_button_pressed() -> void:
	_toggle_visible_tab(0)

func _on_options_button_pressed() -> void:
	_toggle_visible_tab(1)
	
func _on_credits_button_pressed() -> void:
	_toggle_visible_tab(2)

func _on_resume_button_pressed() -> void:
	level_resumed.emit()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_pane_level_selected(map_id: int) -> void:
	level_selected.emit(map_id)
