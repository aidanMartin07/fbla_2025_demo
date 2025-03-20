extends Node
class_name TransitionManager

@export var player: CharacterBody2D

var transition_node = preload("res://entities/level_transition_box/level_transition_box.tscn")

@export var level_scenes: Array[String]

func load_transition_button(next_level: String):
	var button = transition_node.instantiate()
	button.set_next_level(next_level)	
	player.get_node("CanvasLayer").add_child(button)

func unload_transition_button():
	player.get_node("CanvasLayer/Level_Transition_Box").queue_free()
