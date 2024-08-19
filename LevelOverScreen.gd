extends Control

func set_solved_moves(count: int):
	$PanelContainer/CenterContainer/VBoxContainer/Label3.text = "%d moves" % count
