extends AnimatableBody2D

@export var moveSpeed: float;
@export var floatComparison: float;

@onready var path_follow: PathFollow2D = get_parent()
@onready var shape_cast: ShapeCast2D = $ShapeCast2D

var target_ratio: float = 0.5;
var moving = false
var direction = 1

signal stoppedMoving

func _ready() -> void:
	shape_cast.target_position.y = -50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (moving):
		path_follow.progress_ratio += delta * moveSpeed * direction
		if (abs(path_follow.progress_ratio - target_ratio) <= floatComparison):
			moving = false
			if (direction == -1): stoppedMoving.emit()
	
func move_scale(weigth: float) -> void:
	var move_ratio = float(weigth / Global.SCALE_MAX_WEIGHT) * 0.5
	target_ratio += move_ratio;
	direction = -1 if move_ratio < 0 else 1 
	moving = true

func get_highest_block(isLeft: bool) -> void:
	var count = shape_cast.get_collision_count()
	if (count > 0):
		var collisionsArray = []
		for i in range(0, count):
			collisionsArray.push_back(shape_cast.get_collider(i))
		#	print("Collider " + str(i) + " has y of " + str(collisionsArray[i].global_position.y))
		collisionsArray.sort_custom(func(a,b): return a.global_position.y > b.global_position.y)		
		var furthestPos = collisionsArray[count - 1].global_position.y
		#print("furthestPos ", furthestPos)
		if (isLeft):
			Global.highest_left_block_position = furthestPos * 0.2
		else:
			Global.highest_right_block_position = furthestPos * 0.2
		var globalPos = shape_cast.global_position.y
		#print("globalPos ", globalPos)
		var targetPos = shape_cast.target_position.y
		#print("targetPos ", targetPos)
		var difference  = (globalPos - furthestPos) * -1
		#print("difference ", difference)
		shape_cast.target_position.y = difference * 0.2
		

		
