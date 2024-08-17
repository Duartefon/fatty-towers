extends Control

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://playable_scene.tscn")


func _on_options_button_pressed() -> void:
	$MarginContainer.visible = false
	$OptionsMenu.visible = true


func _on_tutorial_button_pressed() -> void:
	$MarginContainer.visible = false
	$TutorialMenu.visible = true
	

func _on_story_button_pressed() -> void:
	$MarginContainer.visible = false
	$StoryMenu.visible = true


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_back_to_menu_pressed() -> void:
	$OptionsMenu.visible = false
	$TutorialMenu.visible = false
	$StoryMenu.visible = false
	$MarginContainer.visible = true


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/credits_menu.tscn")
