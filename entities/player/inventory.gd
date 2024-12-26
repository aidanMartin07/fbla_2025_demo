extends Control

@onready var money: Label = $Panel/GridContainer/Money
@onready var lemons: Label = $Panel/GridContainer/Lemons
@onready var coffee: Label = $Panel/GridContainer/Coffee
@onready var muffins: Label = $Panel/GridContainer/Muffins

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money.text = "Money: " + str(PlayerManager.inventory["money"])
	lemons.text = "Lemons: " + str(PlayerManager.inventory["lemon"])
	coffee.text = "Coffee: " + str(PlayerManager.inventory["coffee_ground"])
	muffins.text = "Muffins: " + str(PlayerManager.inventory["muffin"])
