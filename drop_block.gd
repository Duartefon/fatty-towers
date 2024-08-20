extends Node2D

@export var stoppedSpeed : float
@export var weight: int

var plate
signal block_stopped(position,weight)

var hasEmitted = false
var canEmit = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (canEmit and !hasEmitted ):
		if (abs($RigidBody2D.linear_velocity.length() - 0) <= stoppedSpeed):
			block_stopped.emit(self.global_position, weight)
			hasEmitted = true



func _on_delay_of_spawn_timeout() -> void:
	canEmit = true
	pass


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	print("Playing thud 1")
	$SFX.play()
