extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_axis("up player 1", "down player 1")
	velocity.y = input_direction * speed

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
