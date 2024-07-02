extends PathFollow2D

@export_category("properties")
@export var health : float = 10.0
@export var speed : float = 4.0

signal EndOfPath(damage)

func _process(delta):
	progress += speed * delta * 60
	if progress_ratio == 1:
		dealDamage(health)
		emit_signal("EndOfPath", health)
		queue_free()

func dealDamage(damage):
	GlobalVariables.hp -= damage
	
	# TODO more logic
