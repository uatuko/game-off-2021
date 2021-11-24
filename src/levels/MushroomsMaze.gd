extends Node2D

func _ready():
	$Player/Sprite.flip_h = true
	$Player._can_double_jump = false 
