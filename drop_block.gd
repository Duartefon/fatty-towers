extends Node2D

@export var stoppedSpeed : float

signal block_dropped(x_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (abs($RigidBody2D.linear_velocity - 0) <= stoppedSpeed):
		block_dropped.emit(self.position.x)
