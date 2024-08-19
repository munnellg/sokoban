extends Control

@export var play: PackedScene

func _ready():
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
	#get_tree().change_scene_to_packed(play)

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
		
func _on_quit_button_pressed():
	get_tree().quit()

