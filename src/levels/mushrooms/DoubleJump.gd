extends Area2D



func _on_DoubleJump_body_entered(body):
	if body is Player:
		body._can_double_jump = true
		$AnimationPlayer.play("bounce")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
