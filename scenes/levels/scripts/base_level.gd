extends Node
class_name BaseLevel

var base_turret = preload("res://scenes/entities/base_turret.tscn")

var base_turret_chosen
var can_place_base_turret

func _ready() -> void:
	base_turret_chosen = false
	EventBus.testTurretPressed.connect(is_base_turret_chosen)

func is_base_turret_chosen(boolean: bool):
	base_turret_chosen = boolean

func _process(delta: float) -> void:
	if base_turret_chosen:
		check_if_can_place()
	

func check_if_can_place():
	#var base_turret_instance = base_turret.instantiate()
	#add_child(base_turret_instance)
	#base_turret_instance.position
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			pass
