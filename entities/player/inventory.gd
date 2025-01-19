extends Control

@onready var money: Label = $Panel/IngredientsGrid/Money
@onready var coffee_grounds: Label = $Panel/IngredientsGrid/CoffeeGrounds
@onready var flour: Label = $Panel/IngredientsGrid/Flour
@onready var milk: Label = $Panel/IngredientsGrid/Milk
@onready var eggs: Label = $Panel/IngredientsGrid/Eggs

@onready var coffee: Label = $Panel/IngredientsGrid2/Coffee
@onready var iced_coffee: Label = $Panel/IngredientsGrid2/IcedCoffee
@onready var bread_roll: Label = $Panel/IngredientsGrid2/BreadRoll
@onready var croissant: Label = $Panel/IngredientsGrid2/Croissant

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	money.text = "Money: " + str(PlayerManager.inventory["money"])
	coffee_grounds.text = "Grounds: " + str(PlayerManager.inventory["coffee_ground"])
	flour.text = "Flour: " + str(PlayerManager.inventory["flour"])
	milk.text = "Milk: " + str(PlayerManager.inventory["milk"])
	eggs.text = "Eggs: " + str(PlayerManager.inventory["eggs"])

	coffee.text = "Coffee: " + str(PlayerManager.completed_crafts["coffee"])
	iced_coffee.text = "Iced Coffee : " + str(PlayerManager.completed_crafts["iced_coffee"])
	bread_roll.text = "Bread : " + str(PlayerManager.completed_crafts["bread_roll"])
	croissant.text = "Croissants : " + str(PlayerManager.completed_crafts["croissant"])
