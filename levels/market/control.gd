extends Control

@onready var money: Label = $Money
@onready var reputation: Label = $Reputation


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money.text = "Money: " + str(PlayerManager.inventory["money"])
	reputation.text = "Reputation:"+  str(PlayerManager.reputation)
	

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/town/town.tscn")
