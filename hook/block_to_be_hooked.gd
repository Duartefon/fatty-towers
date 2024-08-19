extends StaticBody2D
#todo rename component and script to platform
var angle := 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	angle += angle
	if angle >= 360: angle = 1
	var x_pos = sin(deg_to_rad(angle)) 
	var y_pos = sin(deg_to_rad(angle))
	print(x_pos)
	
	global_position += Vector2(x_pos, y_pos)
	
