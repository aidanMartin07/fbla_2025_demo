extends AnimatedSprite2D

class_name AnimationController
	
const MOVEMENT_TO_IDLE = {
	"walk_down": "idle_down",
	"walk_up": "idle_up",
	"walk_left": "idle_left",
	"walk_right": "idle_right"
	}


func play_movement_animation(velocity: Vector2):
	if(velocity.x > 0 and velocity.y == 0):
		play("walk_right")
	elif(velocity.x < 0 and velocity.y == 0):
		play("walk_left")
	
	if(velocity.y > 0):
		play("walk_down")
	elif(velocity.y < 0):
		play("walk_up")
	

func play_idle_animation():
	if MOVEMENT_TO_IDLE.keys().has(animation):
		play(MOVEMENT_TO_IDLE[animation])
