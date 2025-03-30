extends Node2D

func _ready() -> void:
	if PlayerManager.chemicals or PlayerManager.quest_lines["npc_2"] != 1:
		queue_free()

func interact() -> void:
	PlayerManager.chemicals = true
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	queue_free()
