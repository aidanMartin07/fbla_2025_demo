extends AnimatedSprite2D


@onready var npc: CharacterBody2D = $".."

const MOVEMENT_TO_IDLE: Dictionary = {
	"walk_down": "idle_down",
	"walk_up": "idle_up",
	"walk_left": "idle_left",
	"walk_right": "idle_right"
}

var npc_name: String
var direction: String

func _ready() -> void:
	npc_name = npc.skin_name

func play_movement_animation(velocity: Vector2) -> void:
	var dir = abs(velocity.y) > abs(velocity.x)
	if(dir):
		if(velocity.y > 0):
			direction = "down"
			play(npc_name + "_walk_down")
		else:
			direction = "up"
			play(npc_name + "_walk_up")
	else:
		if(velocity.x > 0):
			direction = "right"
			play(npc_name + "_walk_right")
		else:
			direction = "left"
			play(npc_name + "_walk_left")

func play_idle_animation(dir: String) -> void:
	if(dir):
		play(npc_name + "_idle_" + dir)
	else:
		play(npc_name + "_idle_down")
