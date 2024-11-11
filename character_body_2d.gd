extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = 400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
	else:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"): # and is_on_floor():
		# velocity.y = JUMP_VELOCITY
		velocity.x += sin(global_rotation) * JUMP_VELOCITY
		velocity.y -= cos(global_rotation) * JUMP_VELOCITY
		printt(global_rotation_degrees, global_rotation, sin(global_rotation), cos(global_rotation), velocity)


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		set_global_rotation_degrees(get_global_rotation_degrees() + direction * 5)
	# else:
	# 	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
