extends Control

@onready var money: RichTextLabel = $Money
@onready var coffee_upgrade_cost: RichTextLabel = $CoffeeUpgradeCost
@onready var iced_coffee_upgrade_cost: RichTextLabel = $IcedCoffeeUpgradeCost
@onready var bread_roll_upgrade_cost: RichTextLabel = $BreadRollUpgradeCost
@onready var croissant_upgrade_cost: RichTextLabel = $CroissantUpgradeCost

var costs: Dictionary = {
	"coffee_ground": 8,
	"milk": 6,
	"eggs": 9,
	"flour": 5,
	"coffee": 100,
	"iced_coffee": 100,
	"bread_roll": 100,
	"croissant": 100,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money.text = "Money:" + str(PlayerManager.inventory["money"])
	
	coffee_upgrade_cost.text = str(costs["coffee"])
	iced_coffee_upgrade_cost.text = str(costs["iced_coffee"])
	bread_roll_upgrade_cost.text = str(costs["bread_roll"])
	croissant_upgrade_cost.text = str(costs["croissant"])

func add_item_to_inv(item: String):
	if(PlayerManager.inventory["money"] >= costs[item]):
		PlayerManager.inventory[item] += 1
		PlayerManager.inventory["money"] -= costs[item]

func add_upgrade_to_inv(upgrade:String):
	if(PlayerManager.inventory["money"] >= costs[upgrade]):
		PlayerManager.upgrades[upgrade] += 0.2
		PlayerManager.inventory["money"] -= costs[upgrade]
		costs[upgrade] *= 2


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


func _on_coffee_upgrade_button_up() -> void:
	add_upgrade_to_inv("coffee")


func _on_iced_coffee_upgrade_button_up() -> void:
	add_upgrade_to_inv("iced_coffee")


func _on_bread_roll_upgrade_button_up() -> void:
	add_upgrade_to_inv("bread_roll")


func _on_croissant_upgrade_button_up() -> void:
	add_upgrade_to_inv("croissant")
