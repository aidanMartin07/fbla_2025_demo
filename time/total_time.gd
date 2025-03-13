extends Node

var total_time = 0
var total_seconds = 0
var days: int = 0

var time: float = 0.0
var time_going: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#updates time globally when game is running
	if(time_going):
		time += delta

	
