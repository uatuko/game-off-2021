extends Node2D

const BASE_SPEED := 80
const LINE_TIME := 0.6
const SECTION_TIME := 2.0

onready var line := $Container/CreditLine
onready var titleLine := $Container/TitleLine

var finished := false
var started := false

var curr_line := 0
var lines := []
var line_timer := 0.0
var section
var section_next := true
var section_timer := 0.0

var credits = [
	[
		"Bugzy"
	],[
		"Programmers",
		"Ashley Allen",
		"Billy Lapatas",
		"Kieran Warwick",
		"Laura Necula",
		"Uditha (Udi) Atukorala",
	],[
		"Level design",
		"Uditha (Udi) Atukorala - Rocks",
		"Laura Necula - Mushrooms",
		"Kieran Warwick - Ice",
	],[
		"Art",
		"Uditha (Udi) Atukorala",
	],[
		"Music",
		"James Boston",
	],[
		"Special thanks",
		"Godot - Game Engine",
	],[
		"Thanks for Playing!"
	]
]


func _process(delta):
	var scroll_speed = BASE_SPEED * delta
	
	if section_next:
		section_timer += delta
		if section_timer >= SECTION_TIME:
			section_timer -= SECTION_TIME

			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	
	else:
		line_timer += delta
		if line_timer >= LINE_TIME:
			line_timer -= LINE_TIME
			add_line()
	
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()

	elif started:
		end_credits()


func add_line():
	var new_line
	if curr_line == 0:
		new_line = titleLine.duplicate()
	else:
		new_line = line.duplicate()

	new_line.text = section.pop_front()
	lines.append(new_line)
	$Container.add_child(new_line)

	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true


func end_credits():
	if not finished:
		finished = true
		get_tree().change_scene("res://src/main.tscn")
