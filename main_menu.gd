extends Control


func _ready() -> void:
	$HowToPlayCanvas.hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_how_to_play_button_pressed() -> void:
	$HowToPlayCanvas.show()

func _on_close_button_pressed() -> void:
	$HowToPlayCanvas.hide()
