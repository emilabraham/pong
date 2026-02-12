extends StaticBody2D

@export var speed = 400
var screen_size

# Adjust position based on input
func move_based_on_input(delta: float):
	if Input.is_action_pressed("up player 1"):
		position.y -= speed * delta
	if Input.is_action_pressed("down player 1"):
		position.y += speed * delta

# Clamp the position of the paddle so we don't move beyond the boundary
func set_paddle_boundary():
	var paddle_half_height = 25.0
	var child_offset_y = 250.0
	position.y = clamp(position.y, -child_offset_y + paddle_half_height, screen_size.y - child_offset_y - paddle_half_height)

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	if not get_parent().game_active:
		return
	move_based_on_input(delta)
	set_paddle_boundary()
