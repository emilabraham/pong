extends RigidBody2D

@export var speed = 100

func _ready() -> void:
	spawn_ball()

func spawn_ball():
	position = Vector2(235,0)
	var angle = randf_range(-PI/4, PI/4)
	if randi() % 2 == 0:
		angle += PI
	linear_velocity = Vector2.RIGHT.rotated(angle) * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		linear_velocity = linear_velocity.bounce(collision.get_normal())
