extends RayCast2D

func _physics_process(delta: float) -> void:
	if is_colliding() and get_collider().is_in_group("TalkingNPC"):
		if(Input.is_action_just_pressed("interact")):
			var npc = get_collider()
			npc.start_dialogue()
			get_parent().talking = !get_parent().talking
