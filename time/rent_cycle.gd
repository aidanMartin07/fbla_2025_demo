extends Label
@onready var label: Label = $"."

var rent_time = TotalTime.total_time

func _physics_process(delta: float) -> void:
	#time = float(time) + delta
	update_ui()

func update_ui():
	rent_time = TotalTime.time -(180 * TotalTime.days)
	var formatted_time = str(rent_time)
	var decimal_index = formatted_time.find(".")
	
	if(decimal_index >0):
		formatted_time = formatted_time.left(decimal_index + 0)
	
	TotalTime.total_time = int(formatted_time)
	
	#print(TotalTime.total_time)
	label.text = "Time:" + formatted_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
