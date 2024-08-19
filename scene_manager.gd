extends Path2D
@onready var block_sprite: Sprite2D = $PendulumFollow/BlockSprite
@export var my_array: Array[PackedScene] = []  
@onready var scale_plate_left = $"../LeftPlatePath/PathFollow2D/ScalePlateV3"
@onready var scale_plate_right = $"../RightPlatePath/PathFollow2D/ScalePlateV3"

var current_block 
var next_block

func _ready() -> void:
	select_block()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dropBlock"):
		spawn() 

func select_block():
	var idx = floor(randf_range(0,my_array.size()))
	next_block = my_array[idx].instantiate()
	block_sprite.texture = next_block.get_node("RigidBody2D/Sprite2D").texture
	block_sprite.scale = next_block.get_node("RigidBody2D/Sprite2D").scale
	
func spawn():
	current_block = next_block
	current_block.global_position = block_sprite.global_position
	add_child(current_block)
	current_block.connect("block_stopped", _on_block_stopped)
	select_block()
	
func _on_block_stopped(pos, weight):
	print("Block has stopped moving!")

	# TODO nao pode ser distancia tem que ser ver se o x está dentro de dois intervalos possiveis
	var dist_to_left = current_block.global_position.distance_squared_to(scale_plate_left.global_position)
	var dist_to_right = current_block.global_position.distance_squared_to(scale_plate_right.global_position)

	if dist_to_left < dist_to_right: # proximo do prato esquerdo
		scale_plate_left.move_scale(weight)   
		scale_plate_right.move_scale(weight * -1) 
		current_block.reparent(scale_plate_left)
		Global.score += weight
	elif dist_to_left > dist_to_right: #proximo prato direito
		scale_plate_right.move_scale(weight)   
		scale_plate_left.move_scale(weight * -1)
		current_block.reparent(scale_plate_right) 
		Global.score += weight
	else:
		Global.score -= weight
	
	
