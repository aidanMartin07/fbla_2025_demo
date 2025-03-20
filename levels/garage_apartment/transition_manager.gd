extends TransitionManager


func _on_town_entrance_body_entered(body: Node2D) -> void:
	load_transition_button(level_scenes[0])

func _on_town_entrance_body_exited(body: Node2D) -> void:
	unload_transition_button()
