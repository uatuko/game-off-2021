class_name Actor

extends KinematicBody2D

const FLOOR_NORMAL := Vector2.UP

# Maximum speed the actor can move horizontally
export var run_max_speed := 400.0
# Rate at which the actor will reach their maximum speed
export var run_acceleration := 3000.0
# Rate at which the actor will be slowed on the floor
export var floor_drag := 2000.0
# Rate at which the actor will be slowed in the air
export var air_drag := 300.0

# Vertical speed that will be applied to the actor when they press the jump button
export var jump_power := 650.0
# Multiplication factor to be applied to gravity for a fall during a jump
export var jump_fall_factor := 2.0
# Multiplication factor to be applied to gravity during a jump to increase flight time
export var jump_flight_factor := 0.45

# Vertical speed of the actor when gliding
export var glide_speed := 200.0

# Rate at which the actor will be accelerated vertically downwards
export var gravity := 3000.0

# The actor's velocity at any moment in time
var _velocity := Vector2.ZERO
