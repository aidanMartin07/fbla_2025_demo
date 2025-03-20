extends Node2D

@onready var day_night_cycle: Node2D = $"../DayNightCycle"

func _ready() -> void:
	#self.visible = false
	DayNightCycle.start_night.connect(toggle_lights)
	DayNightCycle.start_day.connect(toggle_lights)
	if(DayNightCycle.day):
		self.visible = false
	else:
		self.visible = true
	print(DayNightCycle.day)

func toggle_lights() -> void:
	#create small delay between turning lights on and off
	await get_tree().create_timer(2.0).timeout
	self.visible = !self.visible
