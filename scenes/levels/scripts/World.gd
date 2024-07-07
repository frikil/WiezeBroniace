extends Area2D

var can_be_clicked

func _ready() -> void:
	can_be_clicked = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and can_be_clicked:
			EventBus.onWorldClicked.emit()

func _on_mouse_entered() -> void:
	can_be_clicked = true

func _on_mouse_exited() -> void:
	can_be_clicked = false
