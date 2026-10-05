extends Node2D


@onready var muzzle: Marker2D = $Muzzle
@onready var spawner_component = $SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component = $ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var animated_sprite_2D: AnimatedSprite2D = $Anchor/AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	fire_rate_timer.timeout.connect(fire_lasers)

func fire_lasers() -> void:
	if Input.is_action_pressed("ui_accept"):
		scale_component.tween_scale()
		spawner_component.spawn(muzzle.global_position)

func _process(delta: float) -> void:
	animate_the_ship()

func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2D.play("lean_left")
	elif move_component.velocity.x > 0:
		animated_sprite_2D.play("lean_right")
	else:
		animated_sprite_2D.play("center")
