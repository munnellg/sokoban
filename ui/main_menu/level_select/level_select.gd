extends PanelContainer

@onready var title_label       = $HBoxContainer/VBoxContainer/TitleLabel
@onready var description_label = $HBoxContainer/VBoxContainer/VBoxContainer/DescriptionLabel
@onready var preview_image     = $HBoxContainer/PreviewImage
@onready var select_button     = $Button

@onready var high_scores       = $HBoxContainer/VBoxContainer/VBoxContainer/HighScores
@onready var rating            = $HBoxContainer/VBoxContainer/VBoxContainer/HighScores/Rating
@onready var best_solve        = $HBoxContainer/VBoxContainer/VBoxContainer/HighScores/BestSolveScore
@onready var fastest_solve     = $HBoxContainer/VBoxContainer/VBoxContainer/HighScores/FastestSolveScore

@export var title       := "Title"
@export var description := ""
@export var level_id    := 0

signal level_selected(i: int)

func _ready():
	if GameState.savegame.current_level < level_id:
		lock_level()
	else:
		unlock_level()

func update_state():
	if GameState.savegame.current_level < level_id:
		lock_level()
	else:
		unlock_level()
		
func lock_level():
	title_label.text       = "LOCKED"
	description_label.text = "You haven't unlocked this level yet"
	
	var tex_size         = preview_image.texture.atlas.get_size()
	var tex_region_size  = preview_image.texture.region.size
	var unit_size        = tex_size / tex_region_size
	preview_image.texture.region.position = tex_region_size * (unit_size - Vector2.ONE)
	select_button.disabled = true
	
	high_scores.hide()
	
func unlock_level():
	var save_data = GameState.get_level_data(level_id)
	
	if save_data != null:
		rating.texture.region.position = Vector2(save_data.rating, 0) * rating.texture.region.size
		best_solve.text    = "N/A" if save_data.best_solve < 0 else "%d moves" % save_data.best_solve
		fastest_solve.text = "N/A" if save_data.fastest_solve < 0 else "%02d:%02d" % [ save_data.fastest_solve / 60, save_data.fastest_solve % 60 ]
		
	title_label.text       = title
	description_label.text = description

	var tex_size         = preview_image.texture.atlas.get_size()
	var tex_region_size  = preview_image.texture.region.size
	var unit_size        = tex_size / tex_region_size
	
	var tex_pos = Vector2(level_id % int(unit_size.x), level_id / int(unit_size.x))
	preview_image.texture.region.position = tex_region_size * tex_pos
	select_button.disabled = false
	
	high_scores.show()
	
func _on_button_pressed():
	level_selected.emit(level_id)
