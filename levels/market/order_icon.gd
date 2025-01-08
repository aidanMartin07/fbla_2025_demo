extends Control

@onready var texture_button: TextureButton = $TextureButton
@onready var icon_button: Button = $IconButton

#String to tell what type of order
var order: String = ""
var rand = RandomNumberGenerator.new()
var price = int(rand.randf_range(5,10))

#need to load icons to convert to Texture2D
var icons = [
	load("res://assets/icons/coffee.png"),
	load("res://assets/icons/lemonade.png"),
	load("res://assets/icons/steven.png"),
]

func set_icon(order_type: String) -> void:
	order = order_type
	match order:
		"coffee":
			texture_button.texture_normal = icons[0]
			texture_button.texture_pressed = icons[0]
			texture_button.texture_hover = icons[0]
		"lemonade":
			texture_button.texture_normal = icons[1]
		"muffin":
			texture_button.texture_normal = icons[2]
		_:
			texture_button.texture_normal = load("res://assets/icons/money.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(price)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	PlayerManager.inventory["money"] += price
	self.queue_free()
