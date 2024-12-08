extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lemon_pressed() -> void:
	PlayerManager.inventory["lemon"] += 1
	print(PlayerManager.inventory["lemon"])
	pass


func _on_coffee_pressed() -> void:
	PlayerManager.inventory["coffee_ground"] += 1
	print(PlayerManager.inventory["coffee_ground"])


func _on_muffin_pressed() -> void:
	PlayerManager.inventory["muffin"] += 1
	print(PlayerManager.inventory["muffin"])
