extends PinJoint2D

@onready var static_body_2d: StaticBody2D = $"../StaticBody2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("dropBlock"):
		set_node_a("")
		print("Tecla direita carregada")
	if Input.is_action_pressed("leftAction"):
		set_node_a("StaticBody2D")
