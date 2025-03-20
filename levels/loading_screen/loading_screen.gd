extends Control

var next_scene: String = "res://levels/town_2/town.tscn"

@onready var progress_bar: ProgressBar = $ProgressBar

var last_progress: float = 0.0

func _ready() -> void:
	ResourceLoader.load_threaded_request(next_scene,"")

func _process(delta: float) -> void:
	TotalTime.time_going = false
	DayNightCycle.active = false
	var progress = []
	var loaded_status = ResourceLoader.load_threaded_get_status(next_scene, progress)
	var new_progress = progress[0] * 100
	
	if(new_progress > last_progress):
		last_progress = new_progress
	
	progress_bar.value = lerp(progress_bar.value, last_progress, delta*5)
	
	if loaded_status == ResourceLoader.ThreadLoadStatus.THREAD_LOAD_LOADED:
		progress_bar.value = 100.0
		var packed_scene = ResourceLoader.load_threaded_get(next_scene)
		await get_tree().create_timer(0.5).timeout
		TotalTime.time_going = true
		DayNightCycle.active = true
		get_tree().change_scene_to_packed(packed_scene)
