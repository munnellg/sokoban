extends Node2D

const Player = preload("res://player/player.tscn")
const Pallet = preload("res://pallets/pallet.tscn")
const Crate  = preload("res://crates/crate.tscn")
const maps   = preload("res://levels/maps.json").maps

var pallets: Array[Vector2] = [
	Vector2(608, 32),
	Vector2(608, 96),
	Vector2(608, 160),
	Vector2(544, 32),
	Vector2(544, 96),
	Vector2(544, 160)
]

var crates: Array[Vector2] = [
	Vector2(-544, 96),
	Vector2(-352, 96),
	Vector2(-352, -96),
	Vector2(-160, -96),
	Vector2(-224, -160),
	Vector2(-352, -224)
]

var player_start = Vector2(96, 160)
var player

func on_pallet(c):
	return c.state == 0

func _ready():
	$LevelOverScreen.hide()
	_reset()
	
func _reset():
	for child in $World.get_children():
		child.queue_free()
	
	for pos in pallets:
		var pallet = Pallet.instantiate()
		pallet.position = pos
		$World.add_child(pallet)
	
	for pos in crates:
		var crate = Crate.instantiate()
		crate.position = pos
		$World.add_child(crate)
	
	player = Player.instantiate()
	player.position = player_start
	$World.add_child(player)

func _process(_delta):
	if get_tree().get_nodes_in_group("crates").all(on_pallet):
		get_tree().call_group("players", "set_process", false)
		
		$LevelOverScreen.set_solved_moves(player.num_steps)
		$LevelOverScreen.show()
	
	if Input.is_action_pressed("ui_accept"):
		_reset()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu/main_menu.tscn")
