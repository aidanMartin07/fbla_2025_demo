extends Node2D

@onready var player: Node2D = $"../Player"


var levels: Dictionary = {
	"market": "res://levels/market/market.tscn",
	"shop": "res://levels/shop/shop.tscn"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_transition_button(next_level: String):
	var button = load("res://entities/level_transition_box/level_transition_box.tscn").instantiate()
	#add_child(button)
	player.get_node("CanvasLayer").add_child(button)
	
func unload_transition_button(node):
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://levels/market/market.tscn")
	load_transition_button(levels["market"])
	
