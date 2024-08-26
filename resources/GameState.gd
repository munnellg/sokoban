extends Node

const SAVEGAME_FILENAME: String = "user://savegame.tres"

var savegame: SaveGameData

func _ready():
	if !FileAccess.file_exists(SAVEGAME_FILENAME):
		savegame = SaveGameData.new()
		save()
	else:
		savegame = load(SAVEGAME_FILENAME)
	
func get_or_create_level_data(id: int) -> LevelStatsData:
	if id < savegame.level_stats.size() and savegame.level_stats[id].level_id == id:
		return savegame.level_stats[id]
	
	for level in savegame.level_stats:
		if level.level_id == id:
			return level
	
	var stats = LevelStatsData.new()
	stats.level_id = id
	savegame.level_stats.append(stats)
	return stats

func get_level_data(id: int) -> LevelStatsData:
	if id < 0 or id >= savegame.level_stats.size():
		return null
	
	if savegame.level_stats[id].level_id == id:
		return savegame.level_stats[id]
	
	for level in savegame.level_stats:
		if level.level_id == id:
			return level
			
	return null

func save():
	ResourceSaver.save(savegame, "user://savegame.tres")
