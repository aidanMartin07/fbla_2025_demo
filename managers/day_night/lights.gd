extends Node2D
class_name Lights


func _ready() -> void:
	DayNightCycle.start_night.connect(toggle_lights)
	DayNightCycle.start_day.connect(toggle_lights)
	if(DayNightCycle.day):
		set_lights_off()
	else:
		set_lights_on()

#Meant to use while player can see night changing
func toggle_lights() -> void:
	#create small delay between turning lights on and off
	await get_tree().create_timer(2.0).timeout
	self.visible = !self.visible

func set_lights_on() -> void:
	self.visible = true

func set_lights_off() -> void:
	self.visible = false
