extends Path2D

var base_enemy = preload("res://scenes/entities/base_enemy.tscn")
var base_enemy2 = preload("res://scenes/entities/base_enemy2.tscn")

## Controlls amount of waves
@export var wave_controller : Array[waveResource]

@onready var timer = %waveCooldownTimer

var wave_counter : int
var enemy_can_spawn : bool
var round_array


func _ready():
	wave_counter = 0
	var enemy_can_spawn = false
	startRound()
	var test = prepareRound(0)

func _process(delta):
	if timer.time_left == 0 and enemy_can_spawn:
		spawnEnemy(round_array)
		if !round_array.is_empty():
			timer.start()
		else:
			enemy_can_spawn = false
			wave_counter += 1

func startRound():
	enemy_can_spawn = true
	timer.start()
	
	round_array = prepareRound(wave_counter)

func prepareRound(index):
	var return_array = []
	for wave in wave_controller[index].wave:
		for i in range(wave.y):
			return_array.append(wave.x)
	
	return return_array

func spawnEnemy(round_array : Array):
	match(int(round_array.pop_front())):
		1:
			print("creating 1")
			add_child(base_enemy.instantiate())
		2:
			print("creating 2")
			add_child(base_enemy2.instantiate())
