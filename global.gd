extends Node2D

class_name Global

var levels = [
	preload("res://levels/Level1.tscn"),
	preload("res://levels/Level2.tscn"),
	preload("res://levels/Level3.tscn"),
	preload("res://levels/Level4.tscn")
]

var at = 0

func advance():
	at += 1
	if at == levels.size():
		get_tree().change_scene_to(levels[0])
	get_tree().change_scene_to(levels[at])
