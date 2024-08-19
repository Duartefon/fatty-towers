extends AnimatableBody2D

@export var moveSpeed: float;
@export var floatComparison: float;

@onready var path_follow: PathFollow2D = get_parent()

var target_ratio: float = 0.5;
var moving = false
var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if (moving):
		path_follow.progress_ratio += delta * moveSpeed * direction
		if (abs(path_follow.progress_ratio - target_ratio) <= floatComparison):
			moving = false
	
	
func move_scale(weigth: float) -> void:
	var move_ratio = float(weigth / Global.SCALE_MAX_WEIGHT) * 0.5
	target_ratio += move_ratio;
	direction = -1 if move_ratio < 0 else 1 
	moving = true
