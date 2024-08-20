extends StaticBody2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.get_parent().queue_free()
	get_tree().change_scene_to_file("res://menus/credits_menu.tscn")
