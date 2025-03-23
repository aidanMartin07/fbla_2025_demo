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
@export var dialog_resource : Dialog

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var dialog_manager: Node2D = $DialogManager

var direction: String = "down"

#dialog vars
var current_state = "start"
var current_branch_index = 0

var dialogue_box = preload("res://entities/dialogue/dialogue_box.tscn")

func _ready() -> void:
	dialog_resource.load_from_json("res://entities/dialogue/dialogues/dialog_data.json")
	dialog_manager.npc = self

func _physics_process(delta: float) -> void:
	sprite.play_idle_animation(direction)

func start_dialogue() -> void:
	var npc_dialogs = dialog_resource.get_npc_dialog(npc_id)
	if npc_dialogs.is_empty():
		return

#gets current branch dialog
func get_current_dialog(): 
	var npc_dialogs = dialog_resource.get_npc_dialog(npc_id)
	if current_branch_index < npc_dialogs.size():
		for dialogs in npc_dialogs[current_branch_index]["dialogs"]:
			if dialogs["state"] == current_state:
				return dialogs
	return null

func set_dialog_tree(branch_index):
	current_branch_index = branch_index
	current_state = "start"

func set_dialog_state(state):
	current_state = state
