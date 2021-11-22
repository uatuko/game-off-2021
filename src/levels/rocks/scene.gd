extends Node2D


func _on_HurtBoxes_body_entered(body):
	if body is Player:
		# TODO:
		#   - Player die animation
		#   - End current run
		#   - Reset to beginning

		print("hit")
