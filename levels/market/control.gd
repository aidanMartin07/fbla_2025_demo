extends Control




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/town_2/town.tscn")


func _on_inventory_button_up() -> void:
	PlayerManager.toggle_inventory()
