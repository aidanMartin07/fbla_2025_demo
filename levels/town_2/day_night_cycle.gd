extends CanvasModulate

const SECONDS_PER_DAY = 180
const MINUTES_PER_DAY = 3
const INGAME_TO_REAL_SECOND_DURATION = (2 * PI )/ SECONDS_PER_DAY

@export var gradient: GradientTexture1D
@export var INGAME_SPEED = 1.0
@export var INITIAL_TIME = 12

var time: float = TotalTime.time
var past_minute: float = -1.0

signal time_tick(day:int, hour:int, minute:int) 

#func _ready() -> void:
	#time = INGAME_TO_REAL_SECOND_DURATION * INITIAL_TIME * SECONDS_PER_DAY

func _physics_process(delta: float) -> void:
	time = TotalTime.time * INGAME_TO_REAL_SECOND_DURATION * INGAME_SPEED
	var value = sin((time - PI / 2.0) + 1.0) / 2.0
	self.color = gradient.gradient.sample(value)
	_recalculate_time()

func _recalculate_time() -> void:
	var total_seconds = int(time / INGAME_TO_REAL_SECOND_DURATION)
	
	var day = int(total_seconds/ SECONDS_PER_DAY)
	var current_day_seconds = total_seconds % SECONDS_PER_DAY
	var minute = int(current_day_seconds / SECONDS_PER_DAY)
	
	#if past_minute != minute:
		#past_minute = minute
		#time_tick.emit(day, current_day_seconds, minute)
