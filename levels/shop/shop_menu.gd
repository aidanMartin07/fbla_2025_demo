extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_button_down() -> void:
	get_tree().change_scene_to_file("res://levels/town/town.tscn")

func _on_muffin_button_up() -> void:
	PlayerManager.inventory["muffin"] += 1
	print(PlayerManager.inventory["muffin"])


func _on_coffee_button_up() -> void:
	PlayerManager.inventory["coffee_ground"] += 1
	print(PlayerManager.inventory["coffee_ground"])


func _on_lemon_button_up() -> void:
	PlayerManager.inventory["lemon"] += 1
	print(PlayerManager.inventory["lemon"])
