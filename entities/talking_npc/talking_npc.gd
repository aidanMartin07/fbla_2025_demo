extends CharacterBody2D

enum States {
	WALKING,
	IDLE,
	DESPAWNED,
	TALKING,
}


@export var player: CharacterBody2D

@export var skin_name: String = "alex"
@export var stats: NPCStats
@export var timeline_name: String

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var direction: String = "down"


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	sprite.play_idle_animation(direction)

func start_dialog():
	Dialogic.start(timeline_name)
