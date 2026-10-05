extends Node2D

@export var GEnemyScene: PackedScene

var margin = 100
var screen_height = ProjectSettings.get_setting("display/window/size/viewport_height")
var can_spawn = true
const MOB_CAP = 6

var x_borders = [0,160]

@onready var spawner_component = $SpawnerComponent
@onready var g_enemy_spawn_timer = $gEnemySpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	g_enemy_spawn_timer.timeout.connect(handle_spawn.bind(GEnemyScene, g_enemy_spawn_timer))

func count_enemies():
	return get_tree().get_node_count_in_group("enemies")
	
func check_can_spawn():
	if count_enemies() == 0 or count_enemies() < MOB_CAP:
		can_spawn = true
	elif count_enemies() == MOB_CAP: 
		can_spawn = false

func left_or_right(list):
	return list[randi() % list.size()]

func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	spawner_component.scene = enemy_scene
	check_can_spawn()
	if can_spawn:
		spawner_component.spawn(Vector2(left_or_right(x_borders), randf_range(0.05*screen_height, 0.35*screen_height)))
	timer.start()
