extends Path2D
@onready var block_sprite: Sprite2D = $PendulumFollow/BlockSprite
@export var my_array: Array[PackedScene] = []  
#array de blocos a partir do inspetor ou assim - done
var teste
#ready 
	#escolher primeiro bloco - done
	#meter sprite correto no pendulo - done
func _ready() -> void:
	select_block()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dropBlock"):
		spawn() 

func select_block():
	var idx = floor(randf_range(0,my_array.size()))
	var new_block = my_array[idx].instantiate()
	block_sprite.texture = new_block.get_node("RigidBody2D/Sprite2D").texture
	block_sprite.scale = new_block.get_node("RigidBody2D/Sprite2D").scale
	return new_block	
func spawn():
	var new_block = select_block()
	new_block.global_position = block_sprite.global_position
	add_child(new_block)

	
	new_block.connect("block_stopped", _on_block_stopped)
	

func _on_block_stopped(pos_x,weight):
	print("Block has stopped moving!")
	#função de spawn (quando se prime espaço) - dne
	# spawn do block - done
	# connect to sinal "block_stopped" a este objeto - done
	# escolher já o proximo bloco para dar display na UI 
	# quanto ao pendulum follow
	# $PendulumFollow.progress_ratio = 0.25
	# $PendulumFollow/Sprite2D trocar o sprite pelo sprite do bloco correto
	
	
#função block_stopped(posição x, peso) 
   # ver se o block está no prato 1 ou 2 
   # meter bloco filho do prato correto
   # ver o que fazer para os blocos não se fuderem todos quando o prato descer
   # adicionar score
   # baixar prato
