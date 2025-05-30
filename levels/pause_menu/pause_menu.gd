extends Control

func resume():
	TotalTime.time_going = true
	get_tree().paused = false
	#$AnimationPlayer.play_backwards("blur")
	PlayerManager.pause_menu_instance = false
	$AnimationPlayer.play_backwards("open")
	await get_tree().create_timer(0.3).timeout
	self.queue_free()
	
func pause():
	TotalTime.time_going = false
	get_tree().paused = true
	$AnimationPlayer.play("open")
	#$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused == false:
			pause()
		else:
			resume()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("esc")):
		resume()


func _on_resume_pressed() -> void:
	resume()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_save_pressed() -> void:
	pass # Replace with function body.
