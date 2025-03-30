extends Control

class_name Crafter

@export var craft_value: float
@export var crafted_item: String
@export var coffee_ground_amount: int
@export var milk_amount: int
@export var flour_amount: int
@export var egg_amount: int

@export var sprite_image: Texture2D
@export var value: float


@onready var amount: RichTextLabel = $Panel/Amount
@onready var progress_bar: ProgressBar = $Panel/ProgressBar
@onready var sprite_2d: Sprite2D = $Panel/Sprite2D
@onready var line_edit: LineEdit = $Panel/LineEdit

var crafting: bool = false
const INVENTORY = preload("res://entities/player/inventory.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = sprite_image
	line_edit.text = str(PlayerManager.market_prices[crafted_item])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(crafted_item)
	amount.text = "[center]" + str(PlayerManager.completed_crafts[crafted_item])
	if(progress_bar.value >= 100 and crafting):
		PlayerManager.completed_crafts[crafted_item] += 1
		progress_bar.value = 0
		crafting = false
	
	if(crafting == true):
		progress_bar.value += craft_value * delta * PlayerManager.upgrades[crafted_item]

func _on_craft_button_button_up() -> void:
	if(crafting):
		return
	progress_bar.value = 0 
	if(PlayerManager.inventory["coffee_ground"] >= coffee_ground_amount and 
	PlayerManager.inventory["milk"] >= milk_amount and PlayerManager.inventory["flour"] >= flour_amount
	and PlayerManager.inventory["eggs"] >= egg_amount):
		crafting = true
		PlayerManager.inventory["coffee_ground"] -= coffee_ground_amount
		PlayerManager.inventory["milk"] -= milk_amount
		PlayerManager.inventory["flour"] -= flour_amount
		PlayerManager.inventory["eggs"] -= egg_amount


func _on_line_edit_text_submitted(new_text: String) -> void:
	PlayerManager.market_prices[crafted_item] =float(new_text)



func _on_line_edit_text_changed(new_text: String) -> void:
	var regex: RegEx = RegEx.new()
	regex.compile("[0-9]")
	
