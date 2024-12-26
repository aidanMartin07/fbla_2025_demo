extends Node

var transition_node = preload("res://entities/level_transition_box/level_transition_box.tscn")

var levels: Dictionary = {
	"market": "res://levels/market/market.tscn",
	"shop": "res://levels/shop/shop.tscn"
}

func load_transition_button() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
