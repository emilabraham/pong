extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("", "", "up player 2", "down player 2")
	velocity = input_direction * speed

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
