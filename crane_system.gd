extends StaticBody2D
var CHANGE_PLATES_SPEEED := 400 
var initial_global_position : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_global_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _input(event: InputEvent) -> void:	
	if event.is_action_pressed("leftAction"):
		var new_position_value := Vector2(global_position.x - CHANGE_PLATES_SPEEED, global_position.y)
		new_position_value.x = clamp(new_position_value.x, initial_global_position.x-400,initial_global_position.x)		
		global_position = new_position_value 
			
	if event.is_action_pressed("rightAction"):
		var new_position_value := Vector2(global_position.x + CHANGE_PLATES_SPEEED, global_position.y)
		new_position_value.x = clamp(new_position_value.x, initial_global_position.x,initial_global_position.x+400)		
		global_position = new_position_value
	
