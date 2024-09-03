extends Control

var elapsed = 0
@export var paused: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not paused:
		elapsed += delta
		
	$Label.text = as_time_str()

func reset():
	elapsed = 0

func pause():
	paused = true

func start():
	paused = false

func as_time_str() -> String:
	return "%02d:%02d" % [ int(elapsed) / 60, int(elapsed) % 60 ]
