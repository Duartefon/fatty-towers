extends PinJoint2D

var child_is_hooked := false
const PLACEABLE_BLOCK_SCENE := preload("res://placeable_block.tscn")
var temporary_child: RigidBody2D
var move_speed := 200  # Speed for moving Node A

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dropBlock"):
		print(temporary_child.freeze)
		temporary_child.freeze  =  !temporary_child.freeze
func _process(delta: float) -> void:
	pass	
	
func _on_timer_timeout() -> void:
	if not child_is_hooked:
		# Instantiate a new temporary child and add it to the scene
		temporary_child = PLACEABLE_BLOCK_SCENE.instantiate()
		add_child(temporary_child)

		# Set position and attach to the PinJoint2D
		temporary_child.global_position += Vector2(0, 300)
		set_node_b(temporary_child.get_path())

		# Apply an initial impulse to the child
		temporary_child.apply_central_impulse(Vector2(-500, 0))
		
		child_is_hooked = true
