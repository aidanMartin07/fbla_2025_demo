extends CanvasLayer


@onready var panel: Panel = $Panel
@onready var text_label: RichTextLabel = $Panel/RichTextLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func set_text(color: String, message: String) -> void:
	text_label.text = "[color="+color+"]" + message

func _ready() -> void:
	animation_player.play("open")
	await get_tree().create_timer(2.0).timeout
	animation_player.play_backwards("open")
	await animation_player.animation_finished
	queue_free()
