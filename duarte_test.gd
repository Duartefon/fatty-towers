extends Node2D
@onready var placeable_block: RigidBody2D = $PlaceableBlock


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(placeable_block.get_node("Sprite2D"))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
