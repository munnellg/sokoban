extends Resource
class_name SokobanMap

enum TileType { PASSABLE, OBSTRUCTED }

@export var size: Vector2
@export var player_start: Vector2
@export var walls: Array # (Array, Vector2)
@export var crates: Array # (Array, Vector2)
@export var pallets: Array # (Array, Vector2)

@export var title: String
@export var description: String

func _init(p_title = "", p_description = "", p_size = Vector2(0, 0), p_walls = [], p_player_start = Vector2(0, 0), p_crates = [], p_pallets = []):
	title        = p_title
	description  = p_description
	size         = p_size
	walls        = p_walls
	player_start = p_player_start
	crates       = p_crates
	pallets      = p_pallets
