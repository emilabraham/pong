extends Node2D

var player_1_score
var player_2_score

func _ready() -> void:
	new_game()

func new_game():
	player_1_score = 0
	player_2_score = 0
