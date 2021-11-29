extends Node2D


func _ready():
	$Player._can_double_jump = false
	$Player/AnimatedSprite.flip_h = true

func _on_HurtBokes_body_entered(body):
	if body is Player:
		yield(body.die(), "completed")
		get_tree().reload_current_scene()
