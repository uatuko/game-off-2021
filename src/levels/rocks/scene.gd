extends Node2D


func _on_HurtBoxes_body_entered(body):
	if body is Player:
		yield(body.die(), "completed")
		get_tree().reload_current_scene()
