extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event: InputEvent) -> void:	
	if event.is_action_pressed("leftAction"):
		print("Tecla esquerda carregada")
	if event.is_action_pressed("rightAction"):
		print("Tecla direita carregada")
		
