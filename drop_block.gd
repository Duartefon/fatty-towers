extends Node2D

@export var stoppedSpeed : float
@export var weight: int
var plate
signal block_stopped(x_position,weight)

var hasEmitted = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!hasEmitted):
		if (abs($RigidBody2D.linear_velocity.length() - 0) <= stoppedSpeed):
			block_stopped.emit(self.position.x, weight)
			hasEmitted = true
