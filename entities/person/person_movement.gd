extends CharacterBody2D


const SPEED = 6000.0

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite_2d: PersonAnimationController = $AnimatedSprite2D
@onready var timer = $Timer

var on_point: bool = true
var walking: bool = false

var random = RandomNumberGenerator.new()

var position_nodes: Array = [
Vector2(75,-525),
Vector2(312,-390),
Vector2(-223,-523),
Vector2(-640,-403),
Vector2(-355,-211),
Vector2(130,288),
Vector2(643,330),
Vector2(580,145),
Vector2(-448,200),
Vector2(-732,283)
]

var spawn_nodes: Array = [
	Vector2(670,-320),
	Vector2(-680,150),
]

var bakery = Vector2(-20,-485)
var going_to_bakery = false

var walking_to: Vector2

func _ready() -> void:
	make_path()

func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * SPEED * delta
	
	if velocity != Vector2.ZERO:
		animated_sprite_2d.play_movement_animation(velocity)
	else:
		animated_sprite_2d.play_idle_animation()
	
	
	move_and_slide()
	
func buy_at_bakery() -> void:
	print("bought something, yolo")

func make_path() -> void:
	if(on_point && going_to_bakery):
		going_to_bakery=false
		position=spawn_nodes.pick_random()
		print(position)
		nav_agent.target_position = position_nodes.pick_random()
		on_point = false
		buy_at_bakery()
	
	elif(on_point):
		var go_to_bakery = randi()%2
		print(go_to_bakery)
		if(go_to_bakery==1):
			print("Going to the bakery")
			going_to_bakery=true
			nav_agent.target_position = bakery
			on_point = false
		else:
			nav_agent.target_position = position_nodes.pick_random()
			on_point = false
			#timer.start(5)
	

func _on_timer_timeout() -> void:
	nav_agent.target_position = position_nodes.pick_random()
	on_point = false
		#on_point = true
		#make_path()


func _on_navigation_agent_2d_navigation_finished() -> void:
	animated_sprite_2d.play("side_to_side")
	on_point = true
	make_path()
