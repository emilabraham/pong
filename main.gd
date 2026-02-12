extends Node2D

var player_1_score
var player_2_score

func _ready() -> void:
	new_game()

func new_game():
	player_1_score = 0
	player_2_score = 0

func _on_left_boundary_body_entered(body: Node2D) -> void:
	if body == $Ball:
		player_2_score += 1
		print("left body entered. Incrementing player 2 score: ", player_2_score)

func _on_right_boundary_body_entered(body: Node2D) -> void:
	if body == $Ball:
		player_1_score += 1
		print("right body entered. Incrementing player 1 score: ", player_1_score)
