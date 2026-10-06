extends Node2D

@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	player.tree_exiting.connect(func():
		await get_tree().create_timer(3).timeout
		get_tree().reload_current_scene())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
