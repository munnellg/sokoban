extends Control

signal next_level_pressed
signal retry_level_pressed

func set_solved_moves(count: int):
	$PanelContainer/CenterContainer/VBoxContainer/Label3.text = "%d moves" % count

func _on_next_level_button_pressed():
	next_level_pressed.emit()

func _on_retry_button_pressed():
	retry_level_pressed.emit()
