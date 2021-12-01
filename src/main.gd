extends Control

onready var start_btn = get_node("CenterContainer/StartBtn")


func _ready():
	start_btn.grab_focus()

func _on_StartBtn_pressed():
	Global.goto_level(Global.Levels.Rocks)
