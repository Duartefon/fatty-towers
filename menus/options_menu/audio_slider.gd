extends Control

@export_enum("Master", "Music", "SoundEffects") var bus_name : String

var busIndex = 0;

func _ready() -> void:
	busIndex = AudioServer.get_bus_index(bus_name)
	$HBoxContainer/HSlider.value = Global.VOLUME_ARRAY[busIndex]

func _on_h_slider_value_changed(value: float) -> void:
	$HBoxContainer/AudioNumber.text = str(value * 100)
	AudioServer.set_bus_volume_db(busIndex, linear_to_db(value))
	Global.VOLUME_ARRAY[busIndex] = value
	
