extends Actor

var _has_double_jumped := false

func _physics_process(delta):
	var is_on_floor = is_on_floor()
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
		if is_on_floor or !_has_double_jumped:
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
	_velocity.y += gravity * delta
	
	# Glide	
	if _has_double_jumped and Input.is_action_pressed("jump") and _velocity.y > 0:
		_velocity.y = clamp(_velocity.y, 0, glide_speed)
	
	# Move player
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
