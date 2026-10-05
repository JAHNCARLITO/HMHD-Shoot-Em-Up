class_name PositionClampComponent
extends Node


@export var actor: Node2D
@export var margin: = 8

var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")
var upper_border = 30
var lower_border = ProjectSettings.get_setting("display/window/size/viewport_height")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	actor.global_position.x = clamp(actor.global_position.x, left_border + margin, right_border - margin)
	actor.global_position.y = clamp(actor.global_position.y, upper_border + margin, lower_border - margin)
