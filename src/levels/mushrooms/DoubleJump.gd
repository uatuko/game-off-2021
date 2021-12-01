extends Area2D



func _on_DoubleJump_body_entered(body):
	if body is Player:
		Global.player_has_wings = true
		$AnimationPlayer.play("bounce")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
