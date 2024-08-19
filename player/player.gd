extends Node2D

@export var grid_size: int = 64

@onready var animation_tree  = $AnimationTree
@onready var collision_ray   = $CollisionRay
@onready var animation_state = animation_tree.get("parameters/playback")

enum Direction { up, down, left, right };
var keystate = [ 0, 0, 0, 0 ]
var impulses = [ Vector2(0, -1), Vector2(0, 1), Vector2(-1, 0), Vector2(1, 0) ]
var moving   = false

var num_steps: int = 0

func imax(a: Array):
	var m = 0
	for i in range(a.size()):
		if a[i] > a[m]:
			m = i
	return m

func _detect_collision(direction):
	collision_ray.set_target_position(direction * grid_size)
	collision_ray.force_raycast_update()
	
	if not collision_ray.is_colliding():
		return false

	var collider = collision_ray.get_collider()
	
	if "push" in collider:
		return collider.push(direction)
	
	return true

func _ready():
	# start facing player
	animation_tree.set("parameters/Idle/blend_position", Vector2(0, 1))
	animation_tree.set("parameters/Walk/blend_position", Vector2(0, 1))
	num_steps = 0
	
func _process(_delta):
	if Input.is_action_just_pressed("ui_up"):     keystate[Direction.up]    = Time.get_ticks_usec()
	if Input.is_action_just_pressed("ui_down"):   keystate[Direction.down]  = Time.get_ticks_usec()
	if Input.is_action_just_pressed("ui_left"):   keystate[Direction.left]  = Time.get_ticks_usec()
	if Input.is_action_just_pressed("ui_right"):  keystate[Direction.right] = Time.get_ticks_usec()
	
	if Input.is_action_just_released("ui_up"):     keystate[Direction.up]    = 0
	if Input.is_action_just_released("ui_down"):   keystate[Direction.down]  = 0
	if Input.is_action_just_released("ui_left"):   keystate[Direction.left]  = 0
	if Input.is_action_just_released("ui_right"):  keystate[Direction.right] = 0
	
	var most_recent_key = imax(keystate)
	
	if keystate[most_recent_key] > 0 and not moving:
		var direction = impulses[most_recent_key]
		var target = position + direction * grid_size if not _detect_collision(direction) else position
		move_to(direction, target)

func move_to(facing, target):
	moving = true
	
	var direction = (target - position).normalized()
	animation_tree.set("parameters/Idle/blend_position", facing)
	animation_tree.set("parameters/Walk/blend_position", facing)
	animation_state.travel("Walk")

	var animation_time = 0.0 if target == position else 0.2
	
	if target != position:
		num_steps += 1
		
	var tween := create_tween()
	tween.set_ease(Tween.EASE_IN)
	var end = $Pivot.position + direction * grid_size
	tween.tween_property($Pivot, "position", end, animation_time)

	await tween.finished
	$Pivot.position = Vector2.ZERO
	position += direction * grid_size
	animation_state.travel("Idle")

	moving = false

