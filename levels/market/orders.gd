extends Control

@onready var order_container: HBoxContainer = $OrderContainer
@onready var order_timer: Timer = $OrderTimer

var order_queue: Array = []
var order_list: Array = ["coffee", "lemonade", "muffin"]
var current_order_amount: int

var order_icon = preload("res://levels/market/order_icon.tscn")

#timer variables
var rand = RandomNumberGenerator.new()
var timer_start: int
const MAX_ORDERS: int = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_order_amount = 0
	timer_start = int(rand.randf_range(3,6))
	order_timer.wait_time = timer_start

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("up")):
		var order_name = order_list[int(rand.randf_range(0,3))]
		add_new_order(order_name)
		

func add_new_order(order_name: String) -> void:
	var new_order = order_icon.instantiate()
	order_container.add_child(new_order)
	new_order.set_icon(order_name) 
	order_queue.append(new_order)
	print(new_order)

func _on_order_timer_timeout() -> void:
	current_order_amount = order_container.get_child_count()
	print(current_order_amount)
	if(current_order_amount < MAX_ORDERS):
		var order_name = order_list[int(rand.randf_range(0,3))]
		add_new_order(order_name)
		current_order_amount += 1
