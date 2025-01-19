extends CharacterBody2D


const SPEED = 6000.0


@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite_2d: PersonAnimationController = $AnimatedSprite2D

var on_point: bool = true
var walking: bool = false

var random = RandomNumberGenerator.new()

var position_nodes: Array = [
	Vector2(-256,-620),
	Vector2(128,-620),
	Vector2(128,-384),
	Vector2(-256,-384)
]

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

func make_path() -> void:
	if(on_point):
		nav_agent.target_position = position_nodes.pick_random()
		on_point = false
	

func _on_timer_timeout() -> void:
	if(position == nav_agent.target_position):
		on_point = true
		make_path()


func _on_navigation_agent_2d_navigation_finished() -> void:
	animated_sprite_2d.play("side_to_side")
	on_point = true
	make_path()
