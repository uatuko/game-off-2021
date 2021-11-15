extends Actor

var _can_double_jump := true
var _can_glide := true

var _has_double_jumped := false


func _physics_process(delta):
	var is_on_floor = is_on_floor()
	var is_jump_pressed = Input.is_action_pressed("jump")
	var move_left_strength = Input.get_action_strength("move_left")
	var move_right_strength = Input.get_action_strength("move_right")

	# Change player sprite direction based on player input
	if move_left_strength > move_right_strength:
		$Sprite.flip_h = true
	elif move_left_strength < move_right_strength:
		$Sprite.flip_h = false

	# Reset double jump if on floor
	if is_on_floor:
		_has_double_jumped = false

	# Move left or right
	_velocity.x -= run_acceleration * move_left_strength * delta
	_velocity.x += run_acceleration * move_right_strength * delta
	_velocity.x = clamp(_velocity.x, -run_max_speed, run_max_speed)

	# Jump
	if Input.is_action_just_pressed("jump"):
		if is_on_floor or (!_has_double_jumped and _can_double_jump):
			_velocity.y = -jump_power

			if !is_on_floor:
				_has_double_jumped = true

	# Decide which kind of drag to use
	var drag
	if is_on_floor:
		drag = floor_drag
	else:
		drag = air_drag

	# Apply horizontal drag
	if _velocity.x > 0:
		_velocity.x = clamp(_velocity.x - drag * delta, 0, run_max_speed)
	else:
		_velocity.x = clamp(_velocity.x + drag * delta, -run_max_speed, 0)

	# Apply gravity
	if is_jump_pressed and _velocity.y < 0:
		# While jumping, weaken gravity so as to enable the player to jump higher
		# The player is jumping when they have the jump button pressed and they
		# have not reached the peak of their jump arc
		_velocity.y += gravity_jumping * delta
	else:
		_velocity.y += gravity * delta

	# Glide
	if _can_glide and _has_double_jumped and is_jump_pressed and _velocity.y > 0:
		_velocity.y = clamp(_velocity.y, 0, glide_speed)

	# Limit player fall speed
	if _velocity.y > 0:
		_velocity.y = clamp(_velocity.y, 0, max_fall_speed)

	# Move player
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
