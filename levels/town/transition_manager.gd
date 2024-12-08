extends Node2D

@onready var player: Node2D = $"../Player"

var transition_node = preload("res://entities/level_transition_box/level_transition_box.tscn")

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
	var button = transition_node.instantiate()
	button.get_node("PanelContainer/GridContainer").set_next_level(next_level)	
	player.get_node("CanvasLayer").add_child(button)


func unload_transition_button(node):
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://levels/market/market.tscn")
	load_transition_button(levels["market"])
	


func _on_shop_area_body_entered(body: Node2D) -> void:
	load_transition_button(levels["shop"])


func _on_shop_area_body_exited(body: Node2D) -> void:
	unload_transition_button(null)


func _on_market_area_body_exited(body: Node2D) -> void:
	unload_transition_button(null)
