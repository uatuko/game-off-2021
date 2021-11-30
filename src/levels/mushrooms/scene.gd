extends Node2D

onready var player = get_node("Player")


func _ready():
	player.animation.flip_h = true
	
	if Global.previous_level == Global.Levels.Rocks:
		player.position = Vector2(-326, -178)
	elif Global.previous_level == Global.Levels.Ice:
		player.position = Vector2(-8430, 175)


func _on_HurtBokes_body_entered(body):
	if body is Player:
		yield(body.die(), "completed")
		Global.goto_level(Global.Levels.Mushrooms)


func _on_Exit_Rocks_body_entered(body):
	if body is Player:
		Global.goto_level(Global.Levels.Rocks)


func _on_Exit_Ice_body_entered(body):
	if body is Player:
		Global.goto_level(Global.Levels.Ice)
