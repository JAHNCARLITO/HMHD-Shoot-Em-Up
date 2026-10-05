extends Node2D

@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var scale_component = $ScaleComponent
@onready var flash_component = $FlashComponent
@onready var hitbox_component = $HitboxComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	scale_component.tween_scale()
	flash_component.flash()
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
