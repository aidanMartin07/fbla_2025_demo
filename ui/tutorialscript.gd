extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _leave_tutorial() -> void:
	get_tree().change_scene_to_file("res://levels/main_menu/main_menu.tscn") # Replace with function body.
