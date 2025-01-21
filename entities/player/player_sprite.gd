extends CharacterBody2D

class_name Player

@onready var animated_sprite_2d: AnimationController = $AnimatedSprite2D
@onready var coords: Label = $"../CanvasLayer/coords"
@onready var canvas_layer: CanvasLayer = $"../CanvasLayer"
@onready var player: Node2D = $Player

const SPEED: float = 11000.0
#const JUMP_VELOCITY = -400.0

var inventory = preload("res://entities/player/inventory.tscn")
var inventory_open: bool = false

func _init() -> void:
	PlayerManager.player_instance = self 
	position.x = PlayerManager.last_town_pos["x"]
	position.y = PlayerManager.last_town_pos["y"]
	

func _ready() -> void:
	coords.add_theme_color_override("font_color", "cyan") 
	#PlayerManager.player_instance = self 
	#position.x = PlayerManager.last_town_pos["x"]
	#position.y = PlayerManager.last_town_pos["y"]

func _physics_process(delta: float) -> void:
	
	if(Input.is_action_just_pressed("tab")):
		if(!inventory_open):
			var add_inv = inventory.instantiate()
			canvas_layer.add_child(add_inv)
			inventory_open = true
		else:
			canvas_layer.get_node("Inventory").queue_free()
			inventory_open = false
	
	
	coords.text = "X:" + str(global_position.x) + "\nY:" + str(global_position.y) +"\nFPS:" + str(Engine.get_frames_per_second())
	
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction.normalized() * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.y = move_toward(velocity.y, 0, SPEED * delta)
	
	if velocity != Vector2.ZERO:
		animated_sprite_2d.play_movement_animation(velocity)
	else:
		animated_sprite_2d.play_idle_animation()
	
	
	move_and_slide()
