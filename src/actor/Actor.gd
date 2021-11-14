extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL := Vector2.UP

export var run_max_speed := 400.0
export var run_acceleration := 3000.0
export var floor_drag := 1500.0
export var air_drag := 250.0

export var jump_power := 900.0
export var glide_speed := 200.0
export var gravity := 2000.0

var _velocity := Vector2.ZERO
