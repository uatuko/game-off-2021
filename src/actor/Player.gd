extends Actor


var _can_glide := false

func _physics_process(delta):
	var is_double_jump := !is_on_floor() and Input.is_action_just_pressed("jump") and !_can_glide
	var direction := get_direction(is_double_jump)
	
	# Look where you are going
	if direction.x < 0:
		$Sprite.flip_h = true
	elif direction.x > 0:
		$Sprite.flip_h = false

	_velocity = get_velocity(_velocity, direction, speed, _can_glide)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	_can_glide = is_double_jump or (_can_glide and !is_on_floor())

func get_direction(is_double_jump: bool) -> Vector2:
	var is_jump := is_on_floor() and Input.is_action_just_pressed("jump")

	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if is_jump or is_double_jump else 1.0
	)

func get_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	can_glide: bool
) -> Vector2:
	var v := linear_velocity

	# Left/right
	v.x = speed.x * direction.x

	# Going downwards while pressing jump after double jump occured
	var is_glide = can_glide and Input.is_action_pressed("jump") and v.y > 0

	if direction.y == -1.0:
		# Jumping
		v.y = speed.y * direction.y
	elif is_glide:
		# Gliding
		v.y = speed.y * 0.1
	else:
		# Falling
		v.y += gravity * get_physics_process_delta_time()

	return v
