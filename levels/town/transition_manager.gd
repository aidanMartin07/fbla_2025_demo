extends Node2D

#player references the player node use it to get child nodes
@onready var player: Node2D = $"../Player"

#player_body references the character_body_2d 
#represents physical body of player use to get position, rotation, etc.
@onready var player_body: Player = $"../Player/CharacterBody2D"



var transition_node = preload("res://entities/level_transition_box/level_transition_box.tscn")

var levels: Dictionary = {
	"market": "res://levels/market/market.tscn",
	"shop": "res://levels/shop/shop.tscn"
}
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	player_body.position.x = PlayerManager.last_town_pos["x"]
	player_body.position.y = PlayerManager.last_town_pos["y"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_transition_button(next_level: String):
	var button = transition_node.instantiate()
	button.set_next_level(next_level)	
	player.get_node("CanvasLayer").add_child(button)
	
	#PlayerManager.last_town_pos["x"] = player_body.position.x
	#PlayerManager.last_town_pos["y"] = player_body.position.y 
	

func unload_transition_button():
	player.get_node("CanvasLayer/Level_Transition_Box").queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	#get_tree().change_scene_to_file("res://levels/market/market.tscn")
	load_transition_button(levels["market"])
	PlayerManager.last_town_pos["x"] = player_body.position.x
	PlayerManager.last_town_pos["y"] = player_body.position.y


func _on_shop_area_body_entered(body: Node2D) -> void:
	load_transition_button(levels["shop"])
	PlayerManager.last_town_pos["x"] = player_body.position.x
	PlayerManager.last_town_pos["y"] = player_body.position.y

func _on_shop_area_body_exited(body: Node2D) -> void:
	unload_transition_button()


func _on_market_area_body_exited(body: Node2D) -> void:
	unload_transition_button()
