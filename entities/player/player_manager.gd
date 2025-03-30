extends Node



var inventory: Dictionary = {
	"money": 500.00,
	"coffee_ground": 0,
	"flour": 0,
	"eggs": 0,
	"milk": 0
}




var upgrades: Dictionary[String, int] = {
	"coffee": 1,
	"iced_coffee": 1,
	"bread_roll": 1,
	"croissant": 1
}

var completed_crafts: Dictionary[String, int] = {
	"coffee": 0,
	"bread_roll": 0,
	"croissant": 0,
	"iced_coffee": 0,
}

var market_prices: Dictionary[String, float] = {
	"coffee": 20,
	"bread_roll": 22,
	"croissant": 22,
	"iced_coffee": 34
}

var upgrade_level: Dictionary[String, int] = {
	"coffee": 1,
	"bread_roll": 1,
	"croissant": 1,
	"iced_coffee": 1
}

var quest_lines: Dictionary[String, int] = {
	"npc_1": 0,
	"npc_2": 0,
}

var trash_left: int = 4
var trash_clean: bool = false
const NOTIFICATION = preload("res://entities/notification/notification.tscn")


var chemicals: bool = false
#increase when player turns in chemicals
var order_chance_increase: float = 0.0

var pause_menu = preload("res://levels/pause_menu/pause_menu.tscn")
var pause_menu_instance: bool = false

#holds position values for last player position in town before entering new building
var last_town_pos: Dictionary = {
	"x": 480,
	"y": -192,
}

var reputation: float = 1
var rent: int = 250

var win = false
var lose = false

var just_paid_rent = false

#determines if there is a instance of player node / sprite
#if null no physical player should be displayed on screen
var player_instance = null 

signal close_inventory
var inventory_open: bool = false
const INVENTORY = preload("res://entities/player/inventory.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signal)

func dialogic_signal(arg: String):
	if arg == "charge_money":
		#take $300 and progress quest line by one
		inventory["money"] -= 300
		quest_lines["npc_1"] = 1
		notify("red", "-$300")
	if arg == "stop_talking":
		player_instance.talking = false
	if arg == "start_chemicals":
		quest_lines["npc_2"] = 1
	if arg == "remove_chemicals":
		chemicals = false
		quest_lines["npc_2"] = 2
		order_chance_increase = 3
	if arg == "park_restored":
		quest_lines["npc_1"] = 3
		reputation += 2.0
		notify("green", "+2 Rep")
		

func notify(color: String, text: String) -> void:
	var notif = NOTIFICATION.instantiate()
	add_child(notif)
	notif.set_text(color, text)

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
		
	if(Input.is_action_just_pressed("tab")):
		toggle_inventory()
	
	
	if(Input.is_action_just_pressed("esc") and player_instance != null):
		if(!pause_menu_instance):
			pause_menu_instance = true
			player_instance.get_node("CanvasLayer").add_child(pause_menu.instantiate())
			player_instance.get_node("CanvasLayer/PauseMenu").pause()
		#else:
			#player_instance.get_parent().get_node("CanvasLayer/PauseMenu").queue_free()
			#pause_menu_instance = false


func toggle_inventory() -> void:
	if(!inventory_open):
		var add_inv = INVENTORY.instantiate()
		add_inv.get_node("Inventory").player =self
		add_child(add_inv)
		inventory_open = true
	else:
		emit_signal("close_inventory")
		inventory_open = false
