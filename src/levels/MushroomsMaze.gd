extends Node2D

func _ready():
	$Player/Sprite.flip_h = true
	$Player._can_double_jump = false 


func _on_DoubleJumpPowerUp_body_entered(body):
	$Player._can_double_jump = true 
	print("can double jump")
