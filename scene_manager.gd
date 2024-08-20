extends Path2D
@onready var block_sprite: Sprite2D = $PendulumFollow/BlockSprite
@export var my_array: Array[PackedScene] = []  
@export var pendulumVerticalSpeed : float

@onready var scale_plate_left = $"../LeftPlatePath/PathFollow2D/ScalePlateV3"
@onready var scale_plate_right = $"../RightPlatePath/PathFollow2D/ScalePlateV3"

@onready var left_plate_left_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/LeftLimit".global_position.x
@onready var left_plate_right_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/RightLimit".global_position.x
@onready var left_plate_bottom_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y

@onready var right_plate_left_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/LeftLimit".global_position.x
@onready var right_plate_right_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/RightLimit".global_position.x
@onready var right_plate_bottom_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y
@onready var initial_height = global_position.y

var current_block 
var next_block
var starting_height
var target_height

var t = 0.0

@onready var can_drop = true;

func _ready() -> void:
	Global.score = 0 
	select_block()
	scale_plate_left.connect("stoppedMoving", adjust_camera_left)
	scale_plate_right.connect("stoppedMoving", adjust_camera_right)
	target_height = initial_height
	starting_height = initial_height

func _process(delta: float) -> void:
	queue_redraw()

func _physics_process(delta):
	$"../Buildings/Corno".rotation_degrees = -40 * ($"../LeftPlatePath/PathFollow2D".progress_ratio - 0.5)
	#t += delta * pendulumVerticalSpeed
	#global_position = Vector2(0, starting_height).lerp(Vector2(0,target_height), t)

func _input(event: InputEvent) -> void:
	if (can_drop):
		if event.is_action_pressed("dropBlock"):
			spawn() 
			can_drop = false;
			$Timer.start()

func _draw() -> void:
	draw_line($"../Buildings/Corno/LeftLineOrigin".global_position, $"../LeftPlatePath/PathFollow2D/ScalePlateV3/LeftLimit".global_position, Color.BLACK, 10, true)
	draw_line($"../Buildings/Corno/LeftLineOrigin".global_position, $"../LeftPlatePath/PathFollow2D/ScalePlateV3/RightLimit".global_position, Color.BLACK, 10, true)
	draw_line($"../Buildings/Corno/RightLineOrigin".global_position, $"../RightPlatePath/PathFollow2D/ScalePlateV3/LeftLimit".global_position, Color.BLACK, 10, true)
	draw_line($"../Buildings/Corno/RightLineOrigin".global_position, $"../RightPlatePath/PathFollow2D/ScalePlateV3/RightLimit".global_position, Color.BLACK, 10, true )
	
func select_block():
	var idx = floor(randf_range(0,my_array.size()))
	next_block = my_array[idx].instantiate()
	block_sprite.texture = next_block.get_node("RigidBody2D/Sprite2D").texture
	block_sprite.scale = next_block.get_node("RigidBody2D/Sprite2D").scale
	if ($PendulumFollow.progress_ratio > 0.25 && $PendulumFollow.progress_ratio <= 0.75):
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
	#print("Block has stopped moving!")

	#print("Block is at " + str(pos))
	
	var isLeft = pos.x >= left_plate_left_limit && pos.x <= left_plate_right_limit && pos.y <= left_plate_bottom_limit
	#print("Left: " + str(left_plate_left_limit) + ", " + str(left_plate_right_limit) + ", " + str(left_plate_bottom_limit) + " - " + str(isLeft));
	var isRight = pos.x >= right_plate_left_limit && pos.x <= right_plate_right_limit && pos.y <= right_plate_bottom_limit
	#print("Right: " + str(right_plate_left_limit) + ", " + str(right_plate_right_limit) + ", " + str(right_plate_bottom_limit) + " - " + str(isRight));

	if isLeft:
		scale_plate_left.move_scale(weight)   
		scale_plate_right.move_scale(weight * -1)
		current_block.reparent(scale_plate_left)
		Global.score += weight
	elif isRight:
		scale_plate_right.move_scale(weight)   
		scale_plate_left.move_scale(weight * -1)
		current_block.reparent(scale_plate_right)
		Global.score += weight
	else:
		Global.score -= weight
	left_plate_bottom_limit = $"../LeftPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y
	right_plate_bottom_limit = $"../RightPlatePath/PathFollow2D/ScalePlateV3/BottomLimit".global_position.y

func adjust_camera_left() -> void:
	scale_plate_left.get_highest_block(true)
	scale_plate_right.get_highest_block(false)
	#adjust_camera_aux()

func adjust_camera_right() -> void:
	scale_plate_right.get_highest_block(false)
	scale_plate_left.get_highest_block(true)
	#adjust_camera_aux()

func adjust_camera_aux() -> void:
	#print("highest_left_block_position ", Global.highest_left_block_position)
	#print("highest_right_block_position ", Global.highest_right_block_position)
	#print("$CameraLimit.global_position.y ", $CameraLimit.global_position.y)
	starting_height = global_position.y
	if (Global.highest_left_block_position > Global.highest_right_block_position):
		if (Global.highest_left_block_position > -INF && Global.highest_left_block_position < $CameraLimit.global_position.y):
			target_height = clamp(initial_height - Global.highest_left_block_position, -INF, initial_height)
	else:
		if (Global.highest_right_block_position > -INF && Global.highest_right_block_position < $CameraLimit.global_position.y):
			target_height = clamp(initial_height - Global.highest_right_block_position, -INF, initial_height) 

func _on_timer_timeout() -> void:
	can_drop = true
