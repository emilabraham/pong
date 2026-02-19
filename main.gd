extends Node2D

var player_1_score
var player_2_score
var game_active := true

func _ready() -> void:
	set_pausing()
	new_game()

func new_game():
	player_1_score = 0
	player_2_score = 0

func set_pausing() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	$PauseScreen.hide()
	$GameOverScreen.hide()
	for child in get_children():
		child.process_mode = Node.PROCESS_MODE_PAUSABLE

func reset_ball():
	game_active = false
	$Ball.linear_velocity = Vector2.ZERO
	await get_tree().create_timer(3.0).timeout
	$Player1.position.y = 0
	$Player2.position.y = 0
	game_active = true
	$Ball.spawn_ball()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") && game_active:
		get_tree().paused = !get_tree().paused
		$PauseScreen.visible = !$PauseScreen.visible

func _on_left_boundary_body_entered(body: Node2D) -> void:
	if body == $Ball:
		player_2_score += 1
		$Player2Score.text = str(player_2_score)
		game_over_screen()
		if (player_1_score < 11 && player_2_score < 11):
			reset_ball()

func _on_right_boundary_body_entered(body: Node2D) -> void:
	if body == $Ball:
		player_1_score += 1
		$Player1Score.text = str(player_1_score)
		game_over_screen()
		if (player_1_score < 11 && player_2_score < 11):
			reset_ball()

func game_over_screen() -> void:
	if player_1_score >= 11:
		$GameOverScreen/WinnerLabel.text = "Player 1 is the winner!"
		$GameOverScreen.show()
		$Ball.linear_velocity = Vector2.ZERO
		game_active = false
		
	if player_2_score >= 11:
		$GameOverScreen/WinnerLabel.text = "Player 2 is the winner!"
		$GameOverScreen.show()
		$Ball.linear_velocity = Vector2.ZERO
		game_active = false

func reset_game() -> void:
	player_1_score = 0
	player_2_score = 0
	$Player1Score.text = str(player_1_score)
	$Player2Score.text = str(player_2_score)
	$GameOverScreen.hide()
	reset_ball()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_play_again_button_pressed() -> void:
	reset_game()
