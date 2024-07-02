extends CanvasLayer

var spawner_node

func _ready() -> void:
	spawner_node = get_parent()
	spawner_node = spawner_node.find_child("Path")
	spawner_node.round_over.connect(_on_round_over)

func _on_start_pressed() -> void:
	spawner_node.startRound()
	$start.disabled = true
	

func _on_turret_test_pressed() -> void:
	pass # Replace with function body.

func _on_round_over():
	$start.disabled = false
