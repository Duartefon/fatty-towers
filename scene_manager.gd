extends Path2D
@onready var block_sprite: Sprite2D = $PendulumFollow/BlockSprite

@export var my_array: Array[PackedScene] = []  
#array de blocos a partir do inspetor ou assim
var teste
func _ready() -> void:
	teste = my_array[0].instantiate()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dropBlock"):
		var new_block = my_array[0].instantiate()
		new_block.scale = block_sprite.scale * 0.0001
		new_block.global_position = block_sprite.global_position
		
		add_child(new_block)
		pass# no input o espaço, dás spawn de um bloco

#ready 
	#escolher primeiro bloco
	#meter sprite correto no pendulo

#função de spawn (quando se prime espaço)
	# spawn do block
	# connect to sinal "block_stopped" a este objeto
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
