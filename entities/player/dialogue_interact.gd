extends RayCast2D

#check if looking at a talking npc and if player already talking
func _physics_process(delta: float) -> void:
	if is_colliding() and get_collider().is_in_group("TalkingNPC") and get_parent().talking == false:
		if(Input.is_action_just_pressed("interact")):
			var npc = get_collider()
			npc.start_dialog()
			get_parent().talking = !get_parent().talking
