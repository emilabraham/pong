extends CharacterBody2D

@export var speed = 400
var screen_size

func get_input():
	var input_direction = Input.get_axis("up player 1", "down player 1")
	velocity.y = input_direction * speed

func set_paddle_boundary():
	var paddle_half_height = 25.0
	var child_offset_y = 250.0
	position.y = clamp(position.y, -child_offset_y + paddle_half_height, screen_size.y - child_offset_y - paddle_half_height)

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
	set_paddle_boundary()
