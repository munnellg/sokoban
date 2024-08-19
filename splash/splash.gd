extends Control

@export var next: PackedScene

func _process(_delta):
	# Allow players to skip splash
	if Input.is_anything_pressed():
		get_tree().change_scene_to_packed(next)

func _on_animation_player_animation_finished(_anim_name):
	get_tree().change_scene_to_packed(next)
