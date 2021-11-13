extends Area2D


func _on_Entrance_body_entered(body):
	Global.from_level = get_parent().name
	Global.walk_direction = body.direction
	get_tree().change_scene("res://src/levels/" + self.name + ".tscn")
