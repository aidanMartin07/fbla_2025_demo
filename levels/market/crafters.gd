extends Control

#Current Crafters
var coffee_crafting: bool = false
var bread_crafting: bool = false
var croissant_crafting: bool = false




var muffin_crafting: bool = false 
var lemonade_crafting: bool = false

@onready var coffee_progress: ProgressBar = $CoffeeProgress
@onready var lemonade_progress: ProgressBar = $LemonadeProgress
@onready var muffin_progress: ProgressBar = $MuffinProgress



var coffee_crafting_progress: int = 0
var lemonade_crafting_progress: int = 0 
var muffin_crafting_progress: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(coffee_progress.value == 100):
		coffee_crafting = false
		PlayerManager.completed_crafts["coffee"] += 1
		coffee_progress.value = 0 
	if(lemonade_progress.value == 100):
		lemonade_crafting = false
		PlayerManager.completed_crafts["lemonade"] += 1
		lemonade_progress.value = 0
	if(muffin_progress.value == 100):
		muffin_crafting = false
		PlayerManager.completed_crafts["muffin"] += 1
		muffin_progress.value = 0
		
	if(coffee_crafting):
		coffee_progress.value += (25 * PlayerManager.upgrades["coffee"]) * delta
	
	if(lemonade_crafting):
		lemonade_progress.value += (25 * PlayerManager.upgrades["lemonade"]) * delta
	
	if(muffin_crafting):
		muffin_progress.value += (25 * PlayerManager.upgrades["muffin"]) * delta


func _on_coffee_craft_button_up() -> void:
	if(!coffee_crafting):
		coffee_crafting = true;
		coffee_progress.value = 0


func _on_lemonade_craft_button_up() -> void:
	if(!lemonade_crafting):
		lemonade_crafting = true;
		lemonade_progress.value = 0

func _on_muffin_craft_button_up() -> void:
	if(!muffin_crafting):
		muffin_crafting = true;
		muffin_progress.value = 0
