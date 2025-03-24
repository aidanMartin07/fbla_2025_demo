extends Control

@onready var text_panel: Panel = $TextPanel
@onready var text: RichTextLabel = $TextPanel/MarginContainer/VBoxContainer/Text
@onready var options: HBoxContainer = $TextPanel/MarginContainer/VBoxContainer/Options
@onready var close_button: Button = $TextPanel/CloseButton
@onready var name_label: RichTextLabel = $CanvasLayer/TextPanel/MarginContainer/VBoxContainer/NameLabel

func _ready() -> void:
	hide_dialog()

func show_dialog(speaker, text, options) -> void: 
	text_panel.visible = true
	
	name_label.text = speaker
	text.text = text
	#Remove existing options
	for option in options.get_children():
		options.remove_child(option)

func hide_dialog() -> void: 
	PlayerManager.player_instance.talking = false


func _on_close_button_button_up() -> void:
	hide_dialog()
