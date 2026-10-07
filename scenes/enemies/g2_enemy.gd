extends Enemy

@onready var timer := $DirectionTimer as Timer

func _ready() -> void:
	super()
		
	move_component.velocity = Vector2(15, 15)
	
	# Use the @onready timer node from your Scene Tree
	timer.timeout.connect(change_direction)
	timer.start()

func change_direction() -> void:
	# Select fresh 1 or -1 directions for both axes on every tick
	var dir_x := 1 if randf() < 0.85 else -1
	
	move_component.velocity = Vector2(15 * dir_x, 15)
