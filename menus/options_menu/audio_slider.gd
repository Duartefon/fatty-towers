extends Control

@export_enum("Master", "Music", "SoundEffects") var bus_name : String

func _on_h_slider_value_changed(value: float) -> void:
	$HBoxContainer/AudioNumber.text = str(value * 100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus_name), linear_to_db(value))
	
