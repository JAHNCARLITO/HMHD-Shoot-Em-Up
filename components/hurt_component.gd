# Give the component a class name so it can be instanced as a custom node
class_name HurtComponent
extends Node

@export var stats_component: StatsComponent


@export var hurtbox_component: HurtboxComponent

func _ready() -> void:
	
	hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
		stats_component.health -= hitbox_component.damage
)
