extends Control



func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://playable_scene.tscn")


func _on_options_button_pressed() -> void:
	pass # Replace with function body.


func _on_tutorial_button_pressed() -> void:
	pass # Replace with function body.


func _on_story_button_pressed() -> void:
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	get_tree().quit()
