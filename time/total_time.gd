extends Node

var total_time = 0
var total_seconds = 0
var days: int = 0


var elapsed_time: float = 0.0
var adjusted_time: int = 0
var time_going: bool = false

var day: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#updates time globally when game is running
	if(time_going):
		elapsed_time += delta
		adjusted_time = int(elapsed_time -(180 * days))
	if(adjusted_time > 0 and adjusted_time < 90):
		day = true
	else:
		day = false
