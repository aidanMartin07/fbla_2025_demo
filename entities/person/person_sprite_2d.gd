extends AnimatedSprite2D

class_name PersonAnimationController
	
	
@export var type: String = "1"

const MOVEMENT_TO_IDLE = {
	"walk_down": "idle_down",
	"walk_up": "idle_up",
	"walk_left": "idle_left",
	"walk_right": "idle_right"
	}

@onready var ani = $AnimatedSprite2D

func play_movement_animation(velocity: Vector2):
	#print(velocity.y, " YVEL", ",...", velocity.x, " XVEL")
	#print("")
	var dir = abs(velocity.y) > abs(velocity.x)
	if(dir):
		if(velocity.y > 0):
			play("walk_down")
			ani.play("down"+type)
		else:
			play("walk_up")
			ani.play("up"+type)
	else:
		if(velocity.x > 0):
			play("walk_right")
			ani.play("right"+type)

		else:
			play("walk_left")
			ani.play("left"+type)

	#if(velocity.y > 0):
		#play("walk_down")
	#elif(velocity.y < 0):
		#play("walk_up")
	#elif(velocity.x > 0 ):
		#play("walk_right")
	#elif(velocity.x < 0 ):
		#play("walk_left")

	

func play_idle_animation():
	if MOVEMENT_TO_IDLE.keys().has(animation):
		play(MOVEMENT_TO_IDLE[animation])
