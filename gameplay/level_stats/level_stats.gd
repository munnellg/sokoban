extends PanelContainer

signal reset_button_pressed

var move_count :
	get():
		return move_count
	set(value):
		move_count = value
		%MovesCount.text = str(value)

var step_count :
	get():
		return step_count
	set(value):
		step_count = value
		%StepsCount.text = str(value)

var elapsed_time : int :
	get():
		return %Clock.elapsed
	set(value):
		%Clock.elapsed = value

###############################################################################
# PRIVATE METHODS
###############################################################################

func _ready() -> void:
	move_count = 0
	step_count = 0

###############################################################################
# PUBLIC METHODS
###############################################################################

func pause_clock() -> void:
	%Clock.pause()

func start_clock() -> void:
	%Clock.start()

func reset_clock() -> void:
	%Clock.reset()

func reset_move_count() -> void:
	%MoveCount.text = "0"

func set_move_count(value: int) -> void:
	%MoveCount.text = str(value)

func pause():
	%Clock.pause()

func restart():
	%Clock.reset()
	%Clock.unpause()
	move_count = 0
	step_count = 0

func unpause():
	%Clock.unpause()

###############################################################################
# SIGNALS
###############################################################################

func _on_reset_button_pressed() -> void:
	reset_button_pressed.emit()
