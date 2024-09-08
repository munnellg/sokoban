extends TileMap

@export var max_width  = 32
@export var max_height = 32
@export var map_id     = 0

@export var Player: PackedScene
@export var Pallet: PackedScene
@export var Crate: PackedScene

@export var maps_resource: Resource

var map_loaded = false
var player

var moves = 0

@onready var clock = $CanvasLayer/LevelStats/HBoxContainer/TimeContainer/HBoxContainer/Clock
@onready var moves_display = $CanvasLayer/LevelStats/HBoxContainer/MovesContainer/HBoxContainer/Moves

signal level_finished
signal level_initialized(size: Vector2)

func _ready():
	draw_ground()
	$CanvasLayer/LevelStats.hide()
	set_moves(0)

func on_pallet(c):
	return c.is_on_pallet()

func draw_ground():
	for x in range(max_width):
		for y in range(max_height):
			set_cell(0, Vector2i(x, y), 0, Vector2i.ZERO)
			
func init_map():
	var map = maps_resource.maps[map_id]
	
	var displacement = floor((Vector2(max_width, max_height) - map.size) / 2)
	
	clear_layer(1)
	
	for child in $Scenery.get_children():
		child.queue_free()
	
	for pos in map.walls:
		set_cell(1, pos + displacement, 1, Vector2i.ZERO)
	
	var half_shift = Vector2(0.5, 0.5)
	
	for pos in map.pallets:
		var pallet = Pallet.instantiate()
		pallet.position = (pos + displacement + half_shift) * Vector2(tile_set.tile_size)
		$Scenery.add_child(pallet)
	
	for pos in map.crates:
		var crate = Crate.instantiate()
		crate.position = (pos + displacement + half_shift) * Vector2(tile_set.tile_size)
		$Scenery.add_child(crate)
		crate.pushed.connect(_count_crate_push)
		
	player = Player.instantiate()
	player.position = (map.player_start + displacement + half_shift) * Vector2(tile_set.tile_size)
	$Scenery.add_child(player)
	
	map_loaded = true
	clock.reset()
	clock.start()
	set_moves(0)
	$CanvasLayer/LevelStats.show()
	level_initialized.emit(map.size * Vector2(tile_set.tile_size))
	
func set_moves(m: int):
	moves = m
	moves_display.text = str(moves)
	
func update_level_stats():
	var save_data = GameState.get_or_create_level_data(map_id)
	
	save_data.rating = 1
	if save_data.best_solve < 0 or moves < save_data.best_solve:
		save_data.best_solve = moves
	
	if save_data.fastest_solve < 0 or clock.elapsed < save_data.fastest_solve:
		save_data.fastest_solve = clock.elapsed

func _r_set_process(seed, value: bool):
	seed.set_process(value)
	for child in seed.get_children():
		_r_set_process(child, value)

func pause():
	set_process(false)
	if player != null:
		player.set_process(false)
	
	clock.set_process(false)
	#_r_set_process(self, false)
	$CanvasLayer/LevelStats.hide()

func unpause():
	#_r_set_process(self, true)
	set_process(true)
	if player != null:
		player.set_process(true)
	
	clock.set_process(true)
	$CanvasLayer/LevelStats.show()
	
func _process(delta):
	
	if get_tree().get_nodes_in_group("crates").all(on_pallet):
		clock.pause()
		level_finished.emit()
	
	if Input.is_action_pressed("ui_accept"):
		init_map()

func _count_crate_push():
	set_moves(moves + 1)
	
func _on_reset_button_pressed():
	init_map()
