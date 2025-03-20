extends Node2D

var active: bool = false

var timestamps: Dictionary = {
	"sunrise": 179, #179
	"sunset": 5, #79
}

var real_time: int
var last_sec: int

signal start_night
signal start_day

var day: bool = true

@onready var label: Label = $CanvasLayer/Label

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	real_time = int(TotalTime.elapsed_time -(16 * TotalTime.days))
	#print(real_time)
	if last_sec == real_time:
		return
	else:
		if last_sec == timestamps["sunrise"]:
			$AnimationPlayer.play("sunrise")
			day = true
			emit_signal("start_day")
		elif last_sec == timestamps["sunset"]:
			$AnimationPlayer.play("sunset")
			day = false
			emit_signal("start_night")
	last_sec = real_time
	#if(real_time > timestamps["sunset"]):
		#day =false
		#$CanvasModulate.color = "5277ba"
	#elif real_time < timestamps["sunset"]:
		#day = true
		#$CanvasModulate.color = "ffffff"
	#print(day)
	
#func _process(delta: float) -> void:
	#label.text = "Elapsed Time: " + str(TotalTime.elapsed_time) + "\nActive: " + str(active) + "\nDay:" + str(day)
