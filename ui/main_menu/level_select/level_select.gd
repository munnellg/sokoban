extends PanelContainer

@export var title       := "Title"
@export var description := ""
@export var level_id    := 0

signal level_selected(i: int)

###############################################################################
# PRIVATE METHODS
###############################################################################

func _ready():
	update_state()

###############################################################################
# PUBLIC METHODS
###############################################################################

func update_state():
	if GameState.savegame.current_level < level_id:
		lock_level()
	else:
		unlock_level()
		
func lock_level():
	%TitleLabel.text       = "LOCKED"
	%DescriptionLabel.text = "You haven't unlocked this level yet"
	
	var tex_size         = %PreviewImage.texture.atlas.get_size()
	var tex_region_size  = %PreviewImage.texture.region.size
	var unit_size        = tex_size / tex_region_size
	%PreviewImage.texture.region.position = tex_region_size * (unit_size - Vector2.ONE)
	%SelectButtonOverlay.disabled = true
	
	%HighScores.hide()
	
func unlock_level():
	var save_data = GameState.get_level_data(level_id)
	
	if save_data != null:
		%Rating.texture.region.position = Vector2(save_data.rating, 0) * %Rating.texture.region.size
		%BestSolveScore.text = "N/A" if save_data.best_solve < 0 else "%d moves" % save_data.best_solve
		%FastestSolveScore.text = "N/A" if save_data.fastest_solve < 0 else "%02d:%02d" % [ int(save_data.fastest_solve) / 60, int(save_data.fastest_solve) % 60 ]
		
	%TitleLabel.text       = title
	%DescriptionLabel.text = description

	var tex_size         = %PreviewImage.texture.atlas.get_size()
	var tex_region_size  = %PreviewImage.texture.region.size
	var unit_size        = tex_size / tex_region_size
	
	var tex_pos = Vector2(level_id % int(unit_size.x), level_id / int(unit_size.x))
	%PreviewImage.texture.region.position = tex_region_size * tex_pos
	%SelectButtonOverlay.disabled = false
	
	%HighScores.show()

###############################################################################
# SIGNALS
###############################################################################

func _on_button_pressed():
	level_selected.emit(level_id)
