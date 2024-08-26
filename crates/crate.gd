extends Area2D

@export var pushable: bool   = true
@export var grid_size: int   = 64

@onready var animated_sprite = $Pivot/AnimatedSprite2D
@onready var collision_ray   = $CollisionRay

enum State { on_pallet, off_pallet }

var state: State = State.off_pallet;

var moving: bool = false

signal on_pallet
signal off_pallet
signal pushed

func push(impulse: Vector2):
	if not moving and not _detect_collision(impulse):
		move_to(position + impulse * grid_size)
		pushed.emit()
		return false
	
	return true

func is_on_pallet():
	return state == State.on_pallet

func move_to(target):
	moving = true
	
	var direction = (target - position).normalized()
	animated_sprite.animation = "Move"

	var animation_time = 0.0 if target == position else 0.2

	var tween := create_tween()
	tween.set_ease(Tween.EASE_IN)
	var end = $Pivot.position + direction * grid_size
	tween.tween_property($Pivot, "position", end, animation_time)

	await tween.finished
	$Pivot.position = Vector2.ZERO
	position += direction * grid_size
	animated_sprite.animation = "Recessed" if state == State.on_pallet else "Idle"

	moving = false

func _process(_delta):
	# if we're already at the target, then switch to idle state
	if not moving:
		animated_sprite.animation = "Recessed" if state == State.on_pallet else "Idle"
	
func _detect_collision(direction):
	collision_ray.set_target_position(direction * grid_size)
	collision_ray.force_raycast_update()
	return collision_ray.is_colliding()

func _on_pallet_check_area_entered(_area):
	state = State.on_pallet
	on_pallet.emit()

func _on_pallet_check_area_exited(_area):
	state = State.off_pallet
	off_pallet.emit()
