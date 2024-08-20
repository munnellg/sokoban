extends Resource
class_name SokobanMaps

@export var maps: Array[SokobanMap]

func _init(p_maps: Array[SokobanMap] = []):
	maps = p_maps

func _to_string():
	return "%s" % [maps]
