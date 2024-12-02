extends GridContainer

var current_level: String = ""
var next_level: String = ""

func set_next_level(level: String):
	next_level = level

func load_next_scene(next_level: String):
	get_tree().change_scene_to_file("res://levels/market/market.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_up() -> void:
	load_next_scene(self.next_level)
