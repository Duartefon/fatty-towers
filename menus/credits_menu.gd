extends Control

func _ready() -> void:
	$MarginContainer/VBoxContainer/Label.text = "Score: " + str(Global.score)

func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://sara_playable.tscn")


func _on_exit_game_pressed() -> void:
	get_tree().quit()
