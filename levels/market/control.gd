extends Control

@onready var money: Label = $Money
@onready var coffee_count: Label = $CoffeeCount
@onready var lemonade_count: Label = $LemonadeCount
@onready var muffin_count: Label = $MuffinCount

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money.text = "Money: " + str(PlayerManager.inventory["money"])
	coffee_count.text = str(PlayerManager.completed_crafts["coffee"])
	lemonade_count.text = str(PlayerManager.completed_crafts["lemonade"])
	muffin_count.text = str(PlayerManager.completed_crafts["muffin"])

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/town/town.tscn")
