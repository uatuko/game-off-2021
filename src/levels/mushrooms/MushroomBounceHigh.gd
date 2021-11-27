extends StaticBody2D


func _on_BouncyTop_body_entered(body):
	if body is Player:
		body.bounce(-2.6)
