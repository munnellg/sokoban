extends Node2D

@export var max_width  = 32
@export var max_height = 32

@export var Player: PackedScene
@export var Pallet: PackedScene
@export var Crate: PackedScene

var player

var tile_size :
	get():
		return %Ground.tile_set.tile_size

signal level_finished
signal level_initialized(size: Vector2)
signal player_moved(direction: Vector2)
signal crate_pushed

###############################################################################
# PRIVATE METHODS
###############################################################################

func _ready() -> void:
	draw_ground()

func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group("crates").all(is_on_pallet):
		level_finished.emit()

###############################################################################
# PUBLIC METHODS
###############################################################################

func is_on_pallet(crate) -> bool:
	return crate.is_on_pallet()

func draw_ground() -> void:
	for x in range(max_width):
		for y in range(max_height):
			%Ground.set_cell(Vector2i(x, y), 0, Vector2i.ZERO)

func load_map(map: SokobanMap) -> Vector2:
	var displacement = floor((Vector2(max_width, max_height) - map.size) / 2)
	
	%Walls.clear()
	
	for child in %Actors.get_children():
		child.queue_free()
	
	for pos in map.walls:
		%Walls.set_cell(pos + displacement, 1, Vector2i.ZERO)
	
	var half_shift = Vector2(0.5, 0.5)
	
	for pos in map.pallets:
		var pallet = Pallet.instantiate()
		pallet.position = (pos + displacement + half_shift) * Vector2(%Ground.tile_set.tile_size)
		%Actors.add_child(pallet)
	
	for pos in map.crates:
		var crate = Crate.instantiate()
		crate.position = (pos + displacement + half_shift) * Vector2(%Ground.tile_set.tile_size)
		%Actors.add_child(crate)
		crate.pushed.connect(_crate_pushed)
		
	player = Player.instantiate()
	player.position = (map.player_start + displacement + half_shift) * Vector2(%Ground.tile_set.tile_size)
	%Actors.add_child(player)
	player.moved.connect(_player_moved)
	return map.size * Vector2(%Ground.tile_set.tile_size)

func _crate_pushed() -> void:
	crate_pushed.emit()

func _player_moved(direction: Vector2) -> void:
	player_moved.emit(direction)

func pause():
	set_process(false)
	if player != null:
		player.set_process(false)
	
func unpause():
	set_process(true)
	if player != null:
		player.set_process(true)
