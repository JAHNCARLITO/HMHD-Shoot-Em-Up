class_name Enemy
extends Node2D

@onready var stats_component: StatsComponent = $StatsComponent as StatsComponent

@onready var move_component = $MoveComponent
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var scale_component = $ScaleComponent
@onready var flash_component = $FlashComponent
@onready var hurtbox_component = $HurtboxComponent
@onready var hitbox_component = $HurtboxComponent/HitboxComponent
@onready var enemy_laser_spawner_component = $EnemyLaserSpawnerComponent
@onready var enemy_fire_rate_timer = $EnemyFireRateTimer
@onready var muzzle = $Muzzle



# Called when the node enters the scene tree for the first time.
func _ready():
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	enemy_fire_rate_timer.timeout.connect(enemy_fire_lasers)
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		scale_component.tween_scale()
		flash_component.flash())
	stats_component.no_health.connect(queue_free)

func enemy_fire_lasers() -> void:
	scale_component.tween_scale()
	enemy_laser_spawner_component.spawn(muzzle.global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
