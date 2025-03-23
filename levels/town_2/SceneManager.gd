extends Node2D

@export var PlayerScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var index = 0
	if GameManager.Players.size()!=0:
		$YSortObject/Player.queue_free()
		
	for i in GameManager.Players:
		print("LOADING PLAYER VALUE:" +str(i))
		var currentPlayer = PlayerScene.instantiate()
		currentPlayer.name = str(GameManager.Players[i].id)
		add_child(currentPlayer)
		for spawn in get_tree().get_nodes_in_group("PlayerSpawnPoint"):
			print(spawn.name+" "+str(index))
			if spawn.name == str(index):
				currentPlayer.global_position = spawn.global_position
		index+=1	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
