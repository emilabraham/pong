extends Node2D

var player_1_score
var player_2_score

func _ready() -> void:
	new_game()

func new_game():
	player_1_score = 0
	player_2_score = 0

func reset_ball():
	$Ball.linear_velocity = Vector2.ZERO
	# TODO: This still allows the paddle to move. We probably want to reset the paddles too.
	await get_tree().create_timer(3.0).timeout
	$Ball.spawn_ball()

func _on_left_boundary_body_entered(body: Node2D) -> void:
	if body == $Ball:
		player_2_score += 1
		$Player2Score.text = str(player_2_score)
		reset_ball()

func _on_right_boundary_body_entered(body: Node2D) -> void:
	if body == $Ball:
		player_1_score += 1
		$Player1Score.text = str(player_1_score)
		reset_ball()
		print("right body entered. Incrementing player 1 score: ", player_1_score)
