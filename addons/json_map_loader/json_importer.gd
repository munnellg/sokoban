@tool
extends EditorImportPlugin

enum Presets { DEFAULT }

func _get_priority():
	return 1.0

func _get_importer_name():
	return "sokoban.jsonmapimporter"

func _get_visible_name():
	return "Sokoban Map"

func _get_recognized_extensions():
	return ["json"]

func _get_save_extension():
	return "tres"
	
func _get_resource_type():
	return "SokobanMaps"

func _get_preset_count():
	return Presets.size()

func _get_preset_name(preset):
	match preset:
		Presets.DEFAULT:
			return "Default"
		_:
			return "Unknown"

func _get_import_options(path, preset):
	match preset:
		Presets.DEFAULT:
			return []
		_:
			return []

func _get_option_visibility(path, option, options):
	return true

func _get_import_order():
	return 0

func _import(source_file, save_path, options, r_platform_variants, r_gen_files):
	var file = FileAccess.open(source_file, FileAccess.READ)
	
	if file == null:
		return FAILED
		
	var test_json_conv = JSON.new()
	
	var error = test_json_conv.parse(file.get_as_text())
	
	if error != OK:
		return error
	
	var json := test_json_conv.get_data()
	var maps: Array[SokobanMap] = []
	
	if typeof(json) == TYPE_ARRAY:
		for m in json:
			maps.append(parse_map(m))
	
	return ResourceSaver.save(SokobanMaps.new(maps), "%s.%s" % [save_path, _get_save_extension()])

func parse_map(json) -> SokobanMap:
	var map = json["map"]
		
	var height: int = map.size()
	var width: int  = map[0].length()
	
	var size = Vector2(width, height)
	
	var player_start = Vector2(0, 0)
	var walls   = Array()
	var crates  = Array()
	var pallets = Array()
	
	for y in range(height):
		for x in range(width):
			var symbol = map[y][x]
			match symbol:
				"#":
					walls.append(Vector2(x, y))
				"@":
					player_start = Vector2(x, y)
				".":
					pallets.append(Vector2(x, y))
				"$":
					crates.append(Vector2(x, y))
				"*":
					crates.append(Vector2(x, y))
					pallets.append(Vector2(x, y))
	
	return SokobanMap.new(json["title"], json["description"], json["is_locked"], size, walls, player_start, crates, pallets)
