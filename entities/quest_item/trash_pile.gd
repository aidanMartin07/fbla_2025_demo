extends Node2D

func _ready() -> void:
	if PlayerManager.quest_lines["npc_1"] != 1:
		queue_free()

func interact() -> void:
	PlayerManager.trash_left -= 1
	if PlayerManager.trash_left <= 0:
		PlayerManager.quest_lines["npc_1"] = 2
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	queue_free()
