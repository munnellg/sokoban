extends Resource
class_name SokobanMaps

@export var maps: Array

func _init(p_maps = []):
	maps = p_maps

func _to_string():
	return "%s" % [maps]
