extends Control

@onready var coffee_progress: ProgressBar = $CoffeeProgress
@onready var lemonade_progress: ProgressBar = $LemonadeProgress
@onready var muffin_progress: ProgressBar = $MuffinProgress

var coffee_crafting: bool = false
var lemonade_crafting: bool = false
var muffin_crafting: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_coffee_craft_button_up() -> void:
	pass # Replace with function body.


func _on_lemonade_craft_button_up() -> void:
	pass # Replace with function body.


func _on_muffin_craft_button_up() -> void:
	pass # Replace with function body.
