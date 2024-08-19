extends PanelContainer

@export var title: String       = "Title"
@export var description: String = ""
@export var level_id: int       = 0

@export var level: PackedScene;

@onready var title_label       = $HBoxContainer/VBoxContainer/TitleLabel
@onready var description_label = $HBoxContainer/VBoxContainer/DescriptionLabel
@onready var preview_image     = $HBoxContainer/PreviewImage

var mouse_over: bool = false

func _ready():
	title_label.text = title
	description_label.text = description

func _on_button_pressed():
	get_tree().change_scene_to_packed(level)
