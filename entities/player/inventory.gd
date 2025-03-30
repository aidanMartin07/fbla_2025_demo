extends Control

@export var player: Node

@onready var money: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid/Money
@onready var coffee_grounds: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid/CoffeeGrounds
@onready var flour: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid/Flour
@onready var milk: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid/Milk
@onready var eggs: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid/Eggs

@onready var coffee: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid2/Coffee
@onready var iced_coffee: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid2/IcedCoffee
@onready var bread_roll: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid2/BreadRoll
@onready var croissant: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid2/Croissant
@onready var rep: Label = $Panel/NumberMargins/HBoxContainer2/IngredientsGrid2/Rep


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#plays open animation and connects to player closing inv
	$Panel/AnimationPlayer.play("open")
	player.close_inventory.connect(close)

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
	rep.text = "Rep: " + str(PlayerManager.reputation)
func close() -> void:
	#plays the open animation backwards and removes node from tree after finished
	$Panel/AnimationPlayer.play_backwards("open")
	await get_tree().create_timer(0.3).timeout
	$".".queue_free()
