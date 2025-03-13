extends Node



var inventory: Dictionary = {
	"money": 500.00,
	"coffee_ground": 0,
	"flour": 0,
	"eggs": 0,
	"milk": 0
}

var upgrades: Dictionary = {
	"coffee": 1,
	"iced_coffee": 1,
	"bread_roll": 1,
	"croissant": 1
}

var completed_crafts: Dictionary = {
	"coffee": 0,
	"bread_roll": 0,
	"croissant": 0,
	"iced_coffee": 0,
}

var market_prices: Dictionary = {
	"coffee": 20,
	"bread_roll": 22,
	"croissant": 22,
	"iced_coffee": 34
}

var upgrade_level: Dictionary = {
	"coffee": 1,
	"bread_roll": 1,
	"croissant": 1,
	"iced_coffee": 1
}

var pause_menu = preload("res://levels/pause_menu/pause_menu.tscn")
var pause_menu_instance: bool = false

#holds position values for last player position in town before entering new building
var last_town_pos: Dictionary = {
	"x": 512,
	"y": -72,
}

var reputation: float = 1
var rent: int = 250

var win = false
var lose = false

var just_paid_rent = false

#determines if there is a instance of player node / sprite
#if null no physical player should be displayed on screen
var player_instance = null 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Every three minutes player pays rent
	#Rent lowered with positive reputation
	#Rent increase with negative reputation
	if(int(TotalTime.total_time% 180) == 0 and TotalTime.total_time != 0 
	and just_paid_rent == false):
		PlayerManager.inventory["money"] -= (rent - reputation)
		TotalTime.days += 1
		just_paid_rent = true
	
	#stops rent from being paid for multiple frames
	if(int(TotalTime.total_time%180 == 1)):
		just_paid_rent = false
	
	if(PlayerManager.inventory["money"] <= 0 and !lose):
		lose = true
		player_instance = null
		get_tree().change_scene_to_file("res://levels/lose_screen/lose_screen.tscn")
	
	if(PlayerManager.inventory["money"] >= 10000 and !win):
		win = true
		player_instance = null
		get_tree().change_scene_to_file("res://levels/win_screen/win_screen.tscn")



	if(Input.is_action_just_pressed("esc") and player_instance != null):
		if(!pause_menu_instance):
			pause_menu_instance = true
			player_instance.get_node("CanvasLayer").add_child(pause_menu.instantiate())
			player_instance.get_node("CanvasLayer/PauseMenu").pause()
		#else:
			#player_instance.get_parent().get_node("CanvasLayer/PauseMenu").queue_free()
			#pause_menu_instance = false
