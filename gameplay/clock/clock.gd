extends Control

@export var elapsed : float = 0
@export var paused: bool :
	set(value):
		set_process(not value)
	get():
		return is_processing()

###############################################################################
# PRIVATE METHODS
###############################################################################

func _process(delta) -> void:
	elapsed += delta
	$Label.text = as_time_str()

###############################################################################
# PUBLIC METHODS
###############################################################################

func reset() -> void :
	elapsed = 0

func pause() -> void :
	set_process(false)

func unpause() -> void :
	set_process(true)

func as_time_str() -> String:
	return "%02d:%02d" % [ int(elapsed) / 60, int(elapsed) % 60 ]
