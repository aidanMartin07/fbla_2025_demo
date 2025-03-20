extends CharacterBody2D

enum States {
	WALKING,
	IDLE,
	DESPAWNED,
	TALKING,
}


@export var player: CharacterBody2D

@export var skin_name: String
@export var npc_id: String
@export var person_name: String
@export var stats: NPCStats
@export var dialogue: NPCDialogue

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction: String = "down"

var dialogue_box = preload("res://entities/dialogue/dialogue_box.tscn")

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	sprite.play_idle_animation(direction)

func start_dialogue() -> void:
	print("Dialogue Start")
