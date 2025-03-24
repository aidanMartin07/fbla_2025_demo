extends Node2D

@export var player: CharacterBody2D
var transition_node = preload("res://entities/level_transition_box/level_transition_box.tscn")

var levels: Dictionary = {
	"market": "res://levels/market/market.tscn",
	"shop": "res://levels/shop/shop.tscn",
	"small_house": "res://levels/small_house/small_house.tscn",
	"garage_apartment": "res://levels/garage_apartment/lobby.tscn",
	"tall_house": "res://levels/tall_house/tall_house.tscn"
}

func _ready() -> void:
	player.position.x = PlayerManager.last_town_pos["x"]
	player.position.y = PlayerManager.last_town_pos["y"]

func load_transition_button(next_level: String):
	var button = transition_node.instantiate()
	button.set_next_level(next_level)	
	player.get_node("CanvasLayer").add_child(button)

func unload_transition_button():
	player.get_node("CanvasLayer/Level_Transition_Box").queue_free()


func _on_shop_entrance_body_entered(body: Node2D) -> void:
	PlayerManager.last_town_pos["x"] = player.position.x
	PlayerManager.last_town_pos["y"] = player.position.y
	load_transition_button(levels["shop"])


func _on_shop_entrance_body_exited(body: Node2D) -> void:
	unload_transition_button()


func _on_market_entrance_body_entered(body: Node2D) -> void:
	PlayerManager.last_town_pos["x"] = player.position.x
	PlayerManager.last_town_pos["y"] = player.position.y
	load_transition_button(levels["market"])


func _on_market_entrance_body_exited(body: Node2D) -> void:
	unload_transition_button()


func _on_small_house_entrance_body_entered(body: Node2D) -> void:
	PlayerManager.last_town_pos["x"] = player.position.x
	PlayerManager.last_town_pos["y"] = player.position.y
	load_transition_button(levels["small_house"])

func _on_small_house_entrance_body_exited(body: Node2D) -> void:
	unload_transition_button()


func _on_garage_apartment_body_entered(body: Node2D) -> void:
	PlayerManager.last_town_pos["x"] = player.position.x
	PlayerManager.last_town_pos["y"] = player.position.y
	load_transition_button(levels["garage_apartment"])


func _on_garage_apartment_body_exited(body: Node2D) -> void:
	unload_transition_button()


func _on_tall_house_entrance_body_entered(body: Node2D) -> void:
	PlayerManager.last_town_pos["x"] = player.position.x
	PlayerManager.last_town_pos["y"] = player.position.y
	load_transition_button(levels["tall_house"])


func _on_tall_house_entrance_body_exited(body: Node2D) -> void:
	unload_transition_button()
