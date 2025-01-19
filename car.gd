extends Node2D

@onready var AniSpri = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(position.x<140 && position.x >130):
		
		print("Stop")
		
		var t = floor(Time.get_ticks_msec()/1000)
		print(t)
		if(t%9<6):
			return
	position.x = position.x -128*delta
	#print(position.x)
	
func _physics_process(delta: float) -> void:
	AniSpri.play("blue_car")
