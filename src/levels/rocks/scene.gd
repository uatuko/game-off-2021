extends Node2D

onready var player = get_node("Player")


func _ready():
	if Global.previous_level == Global.Levels.Ice:
		player.position = Vector2(-540, 624)
	elif Global.previous_level == Global.Levels.Mushrooms:
		player.position = Vector2(4530, -1060)
		player.animation.flip_h = true


func _on_HurtBoxes_body_entered(body):
	if body is Player:
		yield(body.die(), "completed")
		Global.goto_level(Global.Levels.Rocks)


func _on_Exit_Ice_body_entered(body):
	if body is Player:
		Global.goto_level(Global.Levels.Ice)


func _on_Exit_Mushrooms_body_entered(body):
	if body is Player:
		Global.goto_level(Global.Levels.Mushrooms)
