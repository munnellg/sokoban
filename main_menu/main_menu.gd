extends Control

@onready var level_list = $HBoxContainer/Sections/Play/VBoxContainer/ScrollContainer/VBoxContainer

const LevelSelect = preload("res://level_select/level_select.tscn")
const maps        = preload("res://levels/maps.json").maps

signal level_selected(map_id: int)
signal level_resumed

func _ready():
	$HBoxContainer/Sections.hide()
	
	for i in range(maps.size()):
		var level_select = LevelSelect.instantiate()
		level_select.title = maps[i].title
		level_select.description = maps[i].description
		level_select.level_id = i
		level_select.level_selected.connect(_on_level_selected)
		level_list.add_child(level_select)

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
