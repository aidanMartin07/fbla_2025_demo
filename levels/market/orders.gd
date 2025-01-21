extends Control

@onready var order_container: HBoxContainer = $OrderContainer
@onready var order_timer: Timer = $OrderTimer

#coffee: $8
#milk: $6
#eggs: $9
#flour: $5

var order_queue: Array = []
var order_list: Array = ["coffee", "iced_coffee", "bread_roll", "croissant"]

var fair_price: Dictionary = {
	"coffee": 20,
	"iced_coffee": 22,
	"bread_roll": 22,
	"croissant": 34
}

var current_order_amount: int

var order_icon = preload("res://levels/market/order_icon.tscn")

#timer variables
var rand = RandomNumberGenerator.new()
var timer_start: int
const MAX_ORDERS: int = 10

var order_chance: float = 0.0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_order_amount = 0
	timer_start = int(rand.randf_range(3,20))
	order_timer.wait_time = timer_start

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("up")):
		var order_name = order_list.pick_random()
		add_new_order(order_name)

func calculate_order_chance(order_name: String) -> void:
	order_chance = 90.0
	var order_price = PlayerManager.market_prices[order_name]
	order_chance *= (fair_price[order_name]/PlayerManager.market_prices[order_name]) * PlayerManager.reputation
	

func add_new_order(order_name: String) -> void:
	var new_order = order_icon.instantiate()
	order_container.add_child(new_order)
	new_order.set_icon(order_name) 
	order_queue.append(new_order)
	current_order_amount += 1

func _on_order_timer_timeout() -> void:
	current_order_amount = order_container.get_child_count()
	print(current_order_amount)
	if(current_order_amount < MAX_ORDERS):
		var order_name = order_list[int(rand.randf_range(0,4))]
		var order_check = int(rand.randf_range(0,100))
		calculate_order_chance(order_name)
		if(order_check <= order_chance):
			add_new_order(order_name)
			PlayerManager.reputation += order_chance/1000
			print("Rep increase: +"+str(order_chance/1000))
		else:
			PlayerManager.reputation -= order_chance/1000
			print("Rep decrease: -" +str(order_chance/1000))
			print("order chance: " + str(order_chance))

			

		
		
