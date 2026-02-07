extends RigidBody2D

@export var speed = 200

func _ready() -> void:
	spawn_ball()

func spawn_ball():
	var angle = randf_range(-PI/4, PI/4)
	if randi() % 2 == 0:
		angle += PI
	linear_velocity = Vector2.RIGHT.rotated(angle) * speed
