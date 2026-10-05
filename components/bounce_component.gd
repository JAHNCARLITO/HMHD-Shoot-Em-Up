class_name BounceComponent
extends Node

@export var move_component: MoveComponent
var left_border = 0
var right_border = 160

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var position = get_parent().global_position
	
	if (position.x > 160 and move_component.velocity.x > 0) or (position.x < 0 and move_component.velocity.x < 0):
		move_component.velocity.x = -move_component.velocity.x
	
