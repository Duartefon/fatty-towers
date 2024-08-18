extends Node2D

@export var stoppedSpeed : float
@export var weight: int

signal block_dropped(x_position)

var hasEmitted = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!hasEmitted):
		if (abs($RigidBody2D.linear_velocity - 0) <= stoppedSpeed):
			block_dropped.emit(self.position.x, weight)
			hasEmitted = true
