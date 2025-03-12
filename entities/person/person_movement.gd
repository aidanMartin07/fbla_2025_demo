extends CharacterBody2D

enum STATE {
	WALKING,
	IDLE,
}

const SPEED = 5000.0

#Should provide position nodes to navigate to
@export var manager: Node2D

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite_2d: PersonAnimationController = $AnimatedSprite2D
@onready var timer = $Timer

var on_point: bool = true
var walking: bool = false

var random = RandomNumberGenerator.new()

var position_nodes: Array[Vector2] 
var spawn_nodes: Array[Vector2] 
var bakery: Vector2

var going_to_bakery = false

var walking_to: Vector2

func _ready() -> void:
	position_nodes = manager.position_nodes
	spawn_nodes = manager.spawn_nodes
	bakery = manager.bakery
	walking_to = position_nodes.pick_random()
	print("walking to: ", walking_to)
	make_path()


func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * SPEED * delta
	
	if velocity != Vector2.ZERO:
		animated_sprite_2d.play_movement_animation(velocity)
	else:
		animated_sprite_2d.play_idle_animation()
	
	make_path()
	move_and_slide()

func start_new_path() -> void:
	pass

func make_path() -> void:
	nav_agent.target_position = walking_to


func _on_navigation_agent_2d_navigation_finished() -> void:
	print("finished path")
	walking_to = position_nodes.pick_random()
