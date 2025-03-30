extends CharacterBody2D

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

enum States {
	WALKING,
	IDLE,
	DESPAWNED,
}

var state := States.IDLE

@export var person_name: String = "bob"
@export var stats: NPCStats

var speed: float 
var position_nodes: Array[Vector2]
var idle_nodes: Array[Vector2]
var spawn_nodes: Array[Vector2]
var bakery: Vector2

var walking_to_idle: bool = false
var despawned: bool = false
var idle_down: bool = true

func _ready() -> void:
	speed = stats.speed
	position_nodes = stats.position_nodes
	idle_nodes = stats.idle_nodes
	spawn_nodes = stats.spawn_nodes
	bakery = stats.bakery
	state = States.WALKING
	pick_new_location()

func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed * delta
	
	if velocity != Vector2.ZERO and state == States.WALKING:
		sprite.play_movement_animation(velocity)
	else:
		sprite.play_idle_animation("down")
	
	
	if state == States.WALKING:
		move_and_slide()

func make_new_path() -> void:
	state = States.WALKING
	var chance = randi_range(0,1)
	pick_new_location()

func make_new_bakery_path() -> void:
	nav_agent.target_position = bakery
	walking_to_idle = false

func make_new_door_path() -> void:
	nav_agent.target_position = position_nodes.pick_random()
	walking_to_idle = false

func make_new_idle_path() -> void:
	nav_agent.target_position = idle_nodes.pick_random()
	walking_to_idle = true

func _on_navigation_agent_2d_navigation_finished() -> void:
	if walking_to_idle:
		state = States.IDLE
		$IdleTimer.start(5)
		return
	else:
		state = States.IDLE
		await get_tree().create_timer(0.25).timeout
		position = Vector2(-3000,3000) # Random Position Off Screen
		$SpawnTimer.start(randf_range(2.5,5.5))
		state = States.DESPAWNED

func pick_new_location() -> void:
	var chance = randi_range(0,100)
	if chance > 10:
		if chance > 30 + PlayerManager.order_chance_increase + PlayerManager.reputation:
			make_new_door_path()
		else:
			make_new_bakery_path()
	else:
		make_new_idle_path()

func _on_idle_timer_timeout() -> void:
	var idle_chance = randi_range(0,1)
	if(idle_chance == 1):
		state = States.WALKING
		make_new_path()
	else:
		$IdleTimer.start(5)


func _on_spawn_timer_timeout() -> void:
	position = spawn_nodes.pick_random()
	state = States.WALKING
	make_new_path()
