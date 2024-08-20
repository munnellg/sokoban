extends PanelContainer

@export var title: String       = "Title"
@export var description: String = ""
@export var level_id: int       = 0

@onready var title_label       = $HBoxContainer/VBoxContainer/TitleLabel
@onready var description_label = $HBoxContainer/VBoxContainer/DescriptionLabel
@onready var preview_image     = $HBoxContainer/PreviewImage

signal level_selected(i: int)

func _ready():
	title_label.text       = title
	description_label.text = description
	
	var tex_size         = preview_image.texture.atlas.get_size()
	var tex_region_size  = preview_image.texture.region.size
	var unit_size        = tex_size / tex_region_size
	
	var tex_pos = Vector2(level_id % int(unit_size.x), level_id / int(unit_size.x))
	preview_image.texture.region.position = tex_region_size * tex_pos

func _on_button_pressed():
	level_selected.emit(level_id)
