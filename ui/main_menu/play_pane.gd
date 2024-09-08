extends PanelContainer

@onready var level_list = %LevelList

@export var LevelSelect: PackedScene
@export var levels_resource: Resource

signal level_selected(map_id: int)

###############################################################################
# PRIVATE METHODS
###############################################################################

func _ready():
	for i in range(levels_resource.maps.size()):
		var level_select = LevelSelect.instantiate()
		level_select.title = levels_resource.maps[i].title
		level_select.description = levels_resource.maps[i].description
		level_select.level_id = i
		level_select.level_selected.connect(_on_level_selected)
		level_list.add_child(level_select)

###############################################################################
# PUBLIC METHODS
###############################################################################

func update_level_state(map_id: int):
	for level in level_list.get_children():
		if level.level_id == map_id:
			level.update_state()
			break

###############################################################################
# SIGNALS
###############################################################################

func _on_level_selected(map_id: int):
	level_selected.emit(map_id)
