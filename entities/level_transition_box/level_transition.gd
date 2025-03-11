extends Control

var current_level: String
var next_level: String = "res://levels/market/market.tscn"

const LOADING_SCREEN = preload("res://levels/loading_screen/loading_screen.tscn")

func set_next_level(level: String):
	self.next_level = level

func load_next_scene(next_level: String):
	var loading_scene = LOADING_SCREEN.instantiate()
	loading_scene.next_scene = self.next_level
	add_child(loading_scene)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("appear")
	await get_tree().create_timer(0.2).timeout
	$AnimationPlayer.play("hover")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("interact")):
		load_next_scene(self.next_level)
	

func _on_button_button_up() -> void:
	load_next_scene(self.next_level)
	
	
	#print(self.next_level)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name =="hover"):
		$AnimationPlayer.play("hover_back")
		print("start backwards")
	else:
		print("start forwards")
		$AnimationPlayer.play("hover")
