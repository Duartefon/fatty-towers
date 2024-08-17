extends Control

func _ready() -> void:
	$HBoxContainer/OptionButton.selected = Global.windowMode
	_on_option_button_item_selected(Global.windowMode)

func _on_option_button_item_selected(index: int) -> void:
	match index:
		0: #Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			DisplayServer.window_set_size(Global.currentResolution)
			Global.isFullscreen = false;
			Global.windowMode = 0
		1: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			Global.isFullscreen = true;
			Global.windowMode = 1
		2: #Borderless Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
			DisplayServer.window_set_size(Global.currentResolution)
			Global.isFullscreen = false;
			Global.windowMode = 2
		_:
			print("Invalid window mode")
