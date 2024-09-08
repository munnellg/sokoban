extends Node2D

@export var maps_resource: Resource
@export var current_level: int = 0

###############################################################################
# Private Methods
###############################################################################

func _ready() -> void:
	%LevelFinished.hide()
	load_level(current_level)

func _adjust_camera_zoom(map_size: Vector2):
	# want a margin of one tile around the border, plus the height of the toolbar at the top of the screen
	var toolbar_size = %LevelStats.size
	var tile_size = Vector2(%World.tile_size)
	var margin_size = tile_size * 2 + Vector2(0, toolbar_size.y)
	var vp_size = get_viewport().get_visible_rect().size - margin_size
	var scale = vp_size / map_size
	scale = min(min(scale.x, scale.y), 1.0)
	$Viewport.set_zoom(Vector2(scale, scale))
	
	var centre_shift = ((Vector2i.ONE + Vector2i(map_size / tile_size)) % 2) * (Vector2i(tile_size) / 2)
	$Viewport.position = Vector2i(0, centre_shift.y - toolbar_size.y)

###############################################################################
# Public Methods
###############################################################################

func load_level(map_id: int) -> void:
	if map_id >= 0 and map_id < maps_resource.maps.size():
		var map_size = %World.load_map(maps_resource.maps[map_id])
		_adjust_camera_zoom(map_size)
		
		%LevelFinished.hide()
		%LevelStats.restart()
		unpause()

func pause():
	%World.pause()
	%LevelStats.pause()
	%LevelStats.hide()

func unpause():
	%World.unpause()
	%LevelStats.unpause()
	%LevelStats.show()

###############################################################################
# SIGNALS
###############################################################################

func _on_world_level_finished() -> void:
	pause()
	%LevelFinished.steps = %LevelStats.move_count
	%LevelFinished.show()

func _on_level_finished_next_level_pressed() -> void:
	current_level += 1
	load_level(current_level)

func _on_level_finished_retry_level_pressed() -> void:
	load_level(current_level)

func _on_world_crate_pushed() -> void:
	%LevelStats.move_count += 1

func _on_world_player_moved(direction: Vector2) -> void:
	%LevelStats.step_count += 1
