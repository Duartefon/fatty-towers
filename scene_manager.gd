extends Path2D
@onready var block_sprite: Sprite2D = $PendulumFollow/BlockSprite
@export var my_array: Array[PackedScene] = []  

@onready var scale_plate_left = $"../LeftPlatePath/PathFollow2D/ScalePlateV3"
@onready var scale_plate_right = $"../RightPlatePath/PathFollow2D/ScalePlateV3"

@onready var left_plate_left_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/LeftLimit".global_position.x
@onready var left_plate_right_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/RightLimit".global_position.x
@onready var left_plate_bottom_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y

@onready var right_plate_left_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/LeftLimit".global_position.x
@onready var right_plate_right_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/RightLimit".global_position.x
@onready var right_plate_bottom_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y

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
	if ($PendulumFollow.progress_ratio <= 0.5):
		$PendulumFollow.progress_ratio = 0.5
	else:
		$PendulumFollow.progress_ratio = 0

	
func spawn():
	current_block = next_block
	current_block.global_position = block_sprite.global_position
	add_child(current_block)
	current_block.connect("block_stopped", _on_block_stopped)
	select_block()
	
func _on_block_stopped(pos, weight):
	print("Block has stopped moving!")

	print("Block is at " + str(pos))
	
	var isLeft = pos.x >= left_plate_left_limit && pos.x <= left_plate_right_limit && pos.y <= left_plate_bottom_limit
	print("Left: " + str(left_plate_left_limit) + ", " + str(left_plate_right_limit) + ", " + str(left_plate_bottom_limit) + " - " + str(isLeft));
	var isRight = pos.x >= right_plate_left_limit && pos.x <= right_plate_right_limit && pos.y <= right_plate_bottom_limit
	print("Right: " + str(right_plate_left_limit) + ", " + str(right_plate_right_limit) + ", " + str(right_plate_bottom_limit) + " - " + str(isRight));

	if isLeft:
		scale_plate_left.move_scale(weight)   
		scale_plate_right.move_scale(weight * -1)
		current_block.reparent($"../LeftPlatePath/PathFollow2D/ScalePlateV3") 
		Global.score += weight
	elif isRight:
		scale_plate_right.move_scale(weight)   
		scale_plate_left.move_scale(weight * -1)
		current_block.reparent($"../RightPlatePath/PathFollow2D/ScalePlateV3") 
		Global.score += weight
	else:
		Global.score -= weight
	left_plate_bottom_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y
	right_plate_bottom_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y
	
