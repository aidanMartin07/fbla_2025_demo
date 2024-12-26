extends Control

var current_level: String
var next_level: String = "res://levels/market/market.tscn"

func set_next_level(level: String):
	self.next_level = level

func load_next_scene(next_level: String):
	get_tree().change_scene_to_file(next_level)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_up() -> void:
	load_next_scene(self.next_level)
	
	
	print(self.next_level)
