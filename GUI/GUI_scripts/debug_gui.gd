extends CanvasLayer

var spawner_node

func _ready() -> void:
	spawner_node = get_parent()
	spawner_node = spawner_node.find_child("Path")
	EventBus.roundOver.connect(_on_round_over)

func _on_start_pressed() -> void:
	spawner_node.startRound()
	$start.disabled = true
	

func _on_round_over():
	$start.disabled = false

func _on_turret_test_toggled(toggled_on: bool) -> void:
	if toggled_on:
		EventBus.testTurretPressed.emit(true)
	else:
		EventBus.testTurretPressed.emit(false)
