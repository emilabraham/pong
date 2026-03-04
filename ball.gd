extends RigidBody2D

@export var speed = 150
var last_paddle_hit: Node = null
var rally_count: int = 0

func _ready() -> void:
	lock_rotation = true
	spawn_ball()

func spawn_ball():
	last_paddle_hit = null
	rally_count = 0
	position = Vector2(235,0)
	var angle = randf_range(-PI/4, PI/4)
	if randi() % 2 == 0:
		angle += PI
	linear_velocity = Vector2.RIGHT.rotated(angle) * speed

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		linear_velocity = linear_velocity.bounce(collision.get_normal()).normalized() * speed
		if collision.get_collider().is_in_group("paddle"):
			rally_count += 1
			last_paddle_hit = collision.get_collider()
			$PaddleHitSound.play()
		elif collision.get_collider().is_in_group("wall"):
			$WallHitSound.play()
