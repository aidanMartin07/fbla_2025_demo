extends Node2D

#Nodes NPCs should spawn from
var position_nodes: Array[Vector2] = [
Vector2(48, -224), #Market
Vector2(-176,-224), #Ice Cream Store
Vector2(-336,-224), #Between Police and IceCream
Vector2(-624,-224), #Police Station
Vector2(496,-224), #Bakery
Vector2(656,-224), #ATM Building
Vector2(1040,-224), #Gray Building With Garage
Vector2(112,592), #Small Gray Apartment
Vector2(112,1072), #Large Gray Apartment
Vector2(-784,432), #Yellow Apartments
]

#Positions NPCs should spawn from
var spawn_nodes: Array[Vector2] = [
	Vector2(-656, -48), #Subway Station Stairs
]

var bakery: Vector2 = Vector2(496,-224)
