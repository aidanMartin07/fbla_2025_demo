extends Control

@export var Address = "127.0.0.1"
@export var port = 8910
var peer

const LOADING_SCREEN = preload("res://levels/loading_screen/loading_screen.tscn")
var town_level = "res://levels/town_2/town.tscn"

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#multiplayer.peer_connected.connect(peer_connected)
	#multiplayer.peer_disconnected.connect(peer_disconnected)
	#multiplayer.connected_to_server.connect(connected_to_server)
	#multiplayer.connection_failed.connect(connection_failed)

#@rpc("any_peer")
#func SendPlayerInformation(name,id):
	#if !GameManager.Players.has(id):
		#GameManager.Players[id] = {
			#"name":name,
			#"id":id,
			#"score":0
		#}
		#
	#if multiplayer.is_server():
		#for i in GameManager.Players:
			#SendPlayerInformation.rpc(GameManager.Players[i].name,i)

@rpc("any_peer", "call_local")
func StartGame():
	var town_level = "res://levels/town_2/town.tscn"
	const LOADING_SCREEN = preload("res://levels/loading_screen/loading_screen.tscn")
	var loading_scene = LOADING_SCREEN.instantiate()
	loading_scene.next_scene = town_level
	add_child(loading_scene)


#Server and client
func peer_connected(id):
	print("Player Connected "+ str(id))
	
func peer_disconnected(id):
	print("Player Disconnected "+ str(id))

#Below only on clients
#func connected_to_server():
	#SendPlayerInformation.rpc_id(1,$LineEdit.text,multiplayer.get_unique_id())
	#print("Connected to Server ")
	
func connection_failed():
	print("Couldn't Connect ")

#func _on_host_button_down() -> void:
	#peer = ENetMultiplayerPeer.new()
	#var error = peer.create_server(port, 2)
	#if error != OK:
		#print("cannot host: " + error)
		#return
	#multiplayer.set_multiplayer_peer(peer);
	#print("Waiting For Players!")
	#SendPlayerInformation($LineEdit.text,multiplayer.get_unique_id())



func _on_join_button_down() -> void:
	peer = ENetMultiplayerPeer.new()
	peer.create_client(Address, port)
	multiplayer.set_multiplayer_peer(peer)



func _on_start_game_button_down() -> void:
	var loading_scene = LOADING_SCREEN.instantiate()
	loading_scene.next_scene = town_level
	add_child(loading_scene)
