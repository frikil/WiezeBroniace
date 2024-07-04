extends Node2D
class_name BaseTurret

var targets_array = []
var current_target
var can_be_clicked : bool
@export_category("Debug")
@export var disabled : bool = true

func _ready() -> void:
	can_be_clicked = false
	EventBus.onWorldClicked.connect(world_clicked)

func _process(delta: float) -> void:
	current_target = find_first_target(targets_array)
	if current_target != null and !disabled:
		look_at(current_target.position)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and can_be_clicked:
			$RangeTexture.visible = true

func _on_shooting_range_area_entered(area: Area2D) -> void:
	targets_array.append(area.get_parent())


func _on_shooting_range_area_exited(area: Area2D) -> void:
	var exit_index = targets_array.find(area.get_parent())
	targets_array.erase(area.get_parent())


func find_first_target(array : Array):
	if array.is_empty():
		return null
	
	var progress_array = []
	var max_progress_index
	
	for i in array:
		progress_array.append(i.progress)
	
	max_progress_index = progress_array.find(progress_array.max())
	
	return array[max_progress_index]

func world_clicked():
	$RangeTexture.visible = false

func _on_turret_hitbox_mouse_entered() -> void:
	can_be_clicked = true

func _on_turret_hitbox_mouse_exited() -> void:
	can_be_clicked = false

