extends Node

enum Levels {
	Undefined = -1,

	Rocks = 0,
	Mushrooms = 1,
	Ice = 2,

	Max = 3,
}

var current_level = Levels.Undefined
var previous_level = Levels.Undefined

var current_scene = null

var player_has_wings = false


func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


func _change_scene(path: String) -> void:
	current_scene.free()

	var s = ResourceLoader.load(path)
	current_scene = s.instance()

	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)


func change_scene(path: String) -> void:
	call_deferred("_change_scene", path)


func goto_level(i: int) -> void:
	if (i > Levels.Undefined && i < Levels.Max) && (current_level != i):
		previous_level = current_level
		current_level = i

	if i == Levels.Rocks:
		change_scene("res://src/levels/rocks/scene.tscn")

	if i == Levels.Mushrooms:
		change_scene("res://src/levels/mushrooms/scene.tscn")

	if i == Levels.Ice:
		change_scene("res://src/levels/ice.tscn")


func roll_credits() -> void:
	current_level = Levels.Undefined
	previous_level = Levels.Undefined
	
	change_scene("res://src/credits/Credits.tscn")
