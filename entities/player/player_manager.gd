extends Node



var inventory: Dictionary = {
	"money": 500.00,
	"lemon": 0,
	"coffee_ground": 0,
	"muffin": 0
}

var upgrades: Dictionary = {
	"coffee": 1,
	"lemonade": 1,
	"muffin": 1,
}

var completed_crafts: Dictionary = {
	"coffee": 0,
	"lemonade": 0,
	"muffin": 0,
}

var pause_menu = preload("res://levels/pause_menu/pause_menu.tscn")
var pause_menu_instance: bool = false

#holds position values for last player position in town before entering new building
var last_town_pos: Dictionary = {
	"x": 16,
	"y": -248,
}

#determines if there is a instance of player node / sprite
#if null no physical player should be displayed on screen
var player_instance = null 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("esc") and player_instance != null):
		if(!pause_menu_instance):
			pause_menu_instance = true
			player_instance.get_parent().get_node("CanvasLayer").add_child(pause_menu.instantiate())
			player_instance.get_parent().get_node("CanvasLayer/PauseMenu").pause()
		#else:
			#player_instance.get_parent().get_node("CanvasLayer/PauseMenu").queue_free()
			#pause_menu_instance = false
