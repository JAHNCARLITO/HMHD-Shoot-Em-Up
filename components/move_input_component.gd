class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStats

func _input(event: InputEvent) -> void:
	var input_axis := Vector2(Input.get_axis("ui_left", "ui_right"),
	Input.get_axis("ui_up", "ui_down"))
	
	if input_axis.length() > 1:
		input_axis = input_axis.normalized()
	move_component.velocity = input_axis * move_stats.speed
