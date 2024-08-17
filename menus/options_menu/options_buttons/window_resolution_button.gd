extends Control

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152x648" : (Vector2i(1152,648)),
	"1280x720" : (Vector2i(1280,720)),
	"1366x768" : (Vector2i(1366,768)),
	"1600x900" : (Vector2i(1600,900)),
	"1920x1080" : (Vector2i(1920,1080)),
	"2560x1440" : (Vector2i(2560,1440)),
	"3840x2160" : (Vector2i(3840,2160))
}
	
func _ready() -> void:
	$HBoxContainer/OptionButton.selected = Global.selectedResolution
	_on_option_button_item_selected(Global.selectedResolution)
	
func _process(delta: float) -> void:
	$HBoxContainer.visible = !Global.isFullscreen
	
func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[0])
			Global.currentResolution = RESOLUTION_DICTIONARY.values()[0]
			Global.selectedResolution = 0
		1:
			DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[1])
			Global.currentResolution = RESOLUTION_DICTIONARY.values()[1]
			Global.selectedResolution = 1
		2:
			DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[2])
			Global.currentResolution = RESOLUTION_DICTIONARY.values()[2]
			Global.selectedResolution = 2
		3:
			DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[3])
			Global.currentResolution = RESOLUTION_DICTIONARY.values()[3]
			Global.selectedResolution = 3
		4: 
			DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[4])
			Global.currentResolution = RESOLUTION_DICTIONARY.values()[4]
			Global.selectedResolution = 4
		5:
			DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[5])
			Global.currentResolution = RESOLUTION_DICTIONARY.values()[5]
			Global.selectedResolution = 5
		6:
			DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[6])
			Global.currentResolution = RESOLUTION_DICTIONARY.values()[6]
			Global.selectedResolution = 6
		_:
			print("Invalid resolution")
