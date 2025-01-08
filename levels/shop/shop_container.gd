extends Control


var costs: Dictionary = {
	"coffee_ground": 25,
	"lemon": 15,
	"muffin": 15,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_item_to_inv(item: String):
	if(PlayerManager.inventory["money"] >= costs[item]):
		PlayerManager.inventory[item] += 1
		PlayerManager.inventory["money"] -= costs[item]

func _on_coffee_button_pressed() -> void:
	add_item_to_inv("coffee_ground")


func _on_lemon_button_pressed() -> void:
	add_item_to_inv("lemon")


func _on_steven_button_pressed() -> void:
	add_item_to_inv("muffin")


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/town/town.tscn")
