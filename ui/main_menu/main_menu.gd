extends Control

@onready var level_list = %MainMenuSections/Play/VBoxContainer/ScrollContainer/VBoxContainer

@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/Main/VBoxContainer/QuitButton

const LevelSelect = preload("res://ui/main_menu/level_select/level_select.tscn")
const maps        = preload("res://levels/maps.json").maps

signal level_selected(map_id: int)
signal level_resumed

func _ready():
	%MainMenuSections.hide()
	
	# hide quit button if we're running in a web browser
	%QuitButton.visible = not OS.has_feature("web")
	
	for i in range(maps.size()):
		var level_select = LevelSelect.instantiate()
		level_select.title = maps[i].title
		level_select.description = maps[i].description
		level_select.level_id = i
		level_select.level_selected.connect(_on_level_selected)
		level_list.add_child(level_select)

func hide_panel_contents():
	%MainMenuSections.hide()

func show_resume_button(visibility: bool):
	%ResumeButton.visible = visibility

func update_level_state(map_id: int):
	for level in level_list.get_children():
		if level.level_id == map_id:
			level.update_state()
			break

func _toggle_visible_tab(tab_id: int) -> void:
	if %MainMenuSections.visible and tab_id == %MainMenuSections.current_tab:
		%MainMenuSections.hide()
	else:
		%MainMenuSections.current_tab = tab_id
		%MainMenuSections.show()

func _on_play_button_pressed() -> void:
	_toggle_visible_tab(0)

func _on_options_button_pressed() -> void:
	_toggle_visible_tab(1)
	
func _on_credits_button_pressed() -> void:
	_toggle_visible_tab(2)

func _on_level_selected(map_id: int):
	level_selected.emit(map_id)

func _on_resume_button_pressed():
	level_resumed.emit()
	
func _on_quit_button_pressed():
	get_tree().quit()
