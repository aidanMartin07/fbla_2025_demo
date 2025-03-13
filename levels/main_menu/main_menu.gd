extends Control

@onready var start: Button = $VBoxContainer/Start

var town_level = "res://levels/town_2/town.tscn"

const LOADING_SCREEN = preload("res://levels/loading_screen/loading_screen.tscn")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	var loading_scene = LOADING_SCREEN.instantiate()
	loading_scene.next_scene = town_level
	add_child(loading_scene)
	#TotalTime.time_going =true

func _on_start_2_button_up() -> void:
	pass # Replace with function body.


func _on_quit() -> void:
	get_tree().quit() # Replace with function body.


func _on_tutorial_pressed() -> void:
	pass
	#get_tree().change_scene_to_file("res://levels")
