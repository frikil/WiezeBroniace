extends Path2D

var base_enemy = preload("res://scenes/entities/base_enemy.tscn")

## Controlls amount of waves
@export var wave_controller : Array[waveResource]

@onready var timer = %waveCooldownTimer

var wave_counter : int
var enemy_can_spawn : bool

func _ready():
	wave_counter = 0
	var enemy_can_spawn = false
	start()

func _process(delta):
	if timer.time_left == 0:
		add_child(base_enemy.instantiate())
		timer.start()

func start():
	timer.start()
