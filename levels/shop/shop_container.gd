extends Control

@onready var money: RichTextLabel = $Money

var costs: Dictionary = {
	"coffee_ground": 25,
	"milk": 15,
	"eggs": 20,
	"flour": 20,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money.text = "Money:" + str(PlayerManager.inventory["money"])

func add_item_to_inv(item: String):
	if(PlayerManager.inventory["money"] >= costs[item]):
		PlayerManager.inventory[item] += 1
		PlayerManager.inventory["money"] -= costs[item]

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/town/town.tscn")


func _on_coffee_purchase_button_up() -> void:
	add_item_to_inv("coffee_ground")


func _on_flour_purchase_button_up() -> void:
	add_item_to_inv("flour")


func _on_milk_purchase_button_up() -> void:
	add_item_to_inv("milk")

func _on_egg_purchase_button_up() -> void:
	add_item_to_inv("eggs")
