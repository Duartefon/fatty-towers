extends Path2D

#array de blocos a partir do inspetor ou assim

# no input o espaço, dás spawn de um bloco

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
