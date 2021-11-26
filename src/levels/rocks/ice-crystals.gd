extends Area2D

onready var sprite = get_node("Sprite")


func _on_Area2D_body_entered(body):
	if body is Player:
		sprite.set_frame(1)


func _on_Area2D_body_exited(body):
	if body is Player:
		sprite.set_frame(0)
