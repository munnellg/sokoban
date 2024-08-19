extends Resource
class_name SokobanMap

enum TileType { PASSABLE, OBSTRUCTED }

@export var size: Vector2
@export var tiles: Array # (Array, TileType)
@export var player_start: Vector2
@export var crates: Array # (Array, Vector2)
@export var pallets: Array # (Array, Vector2)

func _init(p_size = Vector2(0, 0), p_tiles = [], p_player_start = Vector2(0, 0), p_crates = [], p_pallets = []):
	size         = p_size
	tiles        = p_tiles
	player_start = p_player_start
	crates       = p_crates
	pallets      = p_pallets

func width():
	return size[0]

func height():
	return size[1]

func at(x : int, y : int):
	return tiles[x + y * width()]

