extends Control

@onready var texture_button: TextureButton = $TextureButton
@onready var icon_button: Button = $IconButton

#String to tell what type of order
var order: String = ""
var rand = RandomNumberGenerator.new()
var set_price: float
var reputation_gain: float

#need to load icons to convert to Texture2D
var icons = [
	load("res://assets/icons/coffee_cup.png"),
	load("res://assets/icons/iced_coffee.png"),
	load("res://assets/icons/bread_loaf.png"),
	load("res://assets/icons/croissant.png")
]

func set_icon(order_type: String, price: float, rep: float) -> void:
	order = order_type
	set_price = price
	reputation_gain = rep
	match order:
		"coffee":
			texture_button.texture_normal = icons[0]
			texture_button.texture_pressed = icons[0]
			texture_button.texture_hover = icons[0]
		"iced_coffee":
			texture_button.texture_normal = icons[1]
		"bread_roll":
			texture_button.texture_normal = icons[2]
		"croissant":
			texture_button.texture_normal = icons[3]
		_:
			print(order)
			texture_button.texture_normal = load("res://assets/icons/money.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(str(set_price))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	if(PlayerManager.completed_crafts[order] > 0):
		PlayerManager.inventory["money"] += set_price
		PlayerManager.completed_crafts[order] -= 1
		PlayerManager.reputation += reputation_gain
		self.queue_free()
