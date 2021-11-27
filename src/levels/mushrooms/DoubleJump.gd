extends Area2D



func _on_DoubleJump_body_entered(body):
	if body is Player:
		body._can_double_jump = true
		
	queue_free()
