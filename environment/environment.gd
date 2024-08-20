extends TileMap

@export var max_width  = 32
@export var max_height = 32
@export var map_id     = 0

const Player = preload("res://player/player.tscn")
const Pallet = preload("res://pallets/pallet.tscn")
const Crate  = preload("res://crates/crate.tscn")

const maps = preload("res://levels/maps.json").maps

var map_loaded = false

signal level_finished

func _ready():
	draw_ground()

func on_pallet(c):
	return c.is_on_pallet()

func draw_ground():
	for x in range(max_width):
		for y in range(max_height):
			set_cell(0, Vector2i(x, y), 0, Vector2i.ZERO)
			
func init_map():
	var map = maps[map_id]
	
	var displacement = floor((Vector2(max_width, max_height) - map.size) / 2)
	
	for child in get_children():
		clear_layer(1)
		child.queue_free()
	
	for pos in map.walls:
		set_cell(1, pos + displacement, 1, Vector2i.ZERO)
	
	var half_shift = Vector2(0.5, 0.5)
	
	for pos in map.pallets:
		var pallet = Pallet.instantiate()
		pallet.position = (pos + displacement + half_shift) * Vector2(tile_set.tile_size)
		add_child(pallet)
	
	for pos in map.crates:
		var crate = Crate.instantiate()
		crate.position = (pos + displacement + half_shift) * Vector2(tile_set.tile_size)
		add_child(crate)
		
	var player = Player.instantiate()
	player.position = (map.player_start + displacement + half_shift) * Vector2(tile_set.tile_size)
	add_child(player)
	
	map_loaded = true

func _process(_delta):
	if get_tree().get_nodes_in_group("crates").all(on_pallet):
		level_finished.emit()
	
	if Input.is_action_pressed("ui_accept"):
		init_map()
	
