# essa função serve pra manter o mesmo char quando o sapo andar 
Base.@pure function change_tile(y)
	if(y[1] > 2 && y[1] < 11)
		return "~"
	elseif(y[1] > 11 && y[1] < 20)
		return ":"
	else
		return "."
	end
end

# troca um numero por um caractere
Base.@pure function replace_matrix(fun, ch)
	if(fun(1)) return ":"
	elseif(fun(2)) return "@"
	elseif(fun(3)) return "~"
	elseif(fun(4)) return "X"
	else return ch
	end
end

Base.@pure function eval_things(value01)
	equal(value02) = (value01 == value02)
	return equal
end


# função chamada pra acabar o jogo
function game_over()
	print_with_color(:blue, "\t\t\t ****** QUIT GAME ******\n\r")
	run(`stty cooked`)
	exit()
end

# função chamada pra acabar o jogo
function next_stage()
	print_with_color(:blue, "\t\t\t ****** WINNER ******\n\r")
	run(`stty cooked`)
	exit()
end


# acaba o njogo se tiver colisão com X ou @, os inimigos
function check_for_colisions(moveMap, x, y)
	if(moveMap[y[1], x[1]] == "@" || moveMap[y[1], x[1]] == "X")
		game_over()
	elseif(moveMap[y[1], x[1]] == "^")
		next_stage()
	end
end

# == move_frog ===============================
# recebe matriz que representa o mapa e as direcoes
# move e printa o mapa

function move_frog(moveMap, left, right, up, down) 
	position = find(x -> x == "W", m) # Encontra posicao do sapo na matriz
	y,x = ind2sub(moveMap,position) # Converte posicao de indice em posicao representação por tupla
	new_x_pos = x + right - left
	new_y_pos = y + down - up
	if(new_x_pos[1] > 1 && new_y_pos[1] > 1 && new_y_pos[1] < size(moveMap, 1) && new_x_pos[1] < size(moveMap, 2))
		check_for_colisions(m, new_x_pos, new_y_pos) # Chama metodo que verifica colisoes e etc...
		moveMap[position] = change_tile(y) # 'Remove' sapo daquela posição (TODO: deveria ser subsituido por o caracter de acordo com o devido 'terreno' que o sapo se encontra)
		moveMap[new_y_pos, new_x_pos] = "W"	    
	end
	return m
end
# ========================================

# == moveLine ===============================
# Recebe linha a ser movimentada
# Novo objeto para substituir a posicao que fica em branco
# Direçao a ser movimentados os carros
#	True move para direita
#	False move para esquerda
# iterador da linha
# tamanho da linha
# numero da linha
function moveLine(streetObject, m, direction,i ,sizei ,line)
	if(i + 1> sizei)
		newSO = m[line,i]
		m[line,i]= streetObject
		return  newSO
	end
	#verifica se está atropelando o SAPO
	if(m[line,i] != "W")
		if(direction)
			newSO = m[line,i]
			m[line,i] = streetObject
			moveLine(newSO,m,direction,i+1,sizei,line)
		return
		else
			streetObject = moveLine(streetObject,m,direction,i+1,sizei,line)
			newSO = m[line,i]
			m[line,i] = streetObject
			return newSO
		end
	else
		#verifica em qual direcao o sapo esta sendo atropelado
		if(direction)
			#verifica se o objeto é capaz de atropelar o sapo
			if(streetObject == "X"  || streetObject == "@" )
				game_over()
			else
				#se nao é, ignora o sapo
				return moveLine(streetObject,m,direction,i+1,sizei,line)
			end
		else
			newSO = moveLine(streetObject,m,direction,i+1,sizei,line)
			#verifica se o objeto é capaz de atropelar o sapo
			if(newSO == "X"  || newSO == "@" )
				game_over()
			else
				#se nao é, ignora o sapo
				return newSO
			end
		end
	end
end

# ====

# == clear ===============================
# chama "clear" no terminal para
# limpar a tela

function clear()
	run(`clear`) # run(x) chama o comando x direto no terminal
end

# == print_map_rec ===============================
# Recebe matriz que representa o mapa do jogo
# Printa essa matriz recursivamente

function print_map_rec(map, j, sizej, i, sizei)


	# print da matriz
	if(map[j, i] == "~")
	    print_with_color(:cyan, map[j, i])
	elseif(map[j, i] == ":")			
		print(map[j, i])
	elseif(map[j, i] == "@" || map[j, i] == "X")
		print_with_color(:red, map[j, i])
	elseif(map[j, i] == "^")
		print_with_color(:magenta, map[j, i], bold=true)
	elseif(map[j, i] == "W")
		print_with_color(:green, map[j, i], bold=true)
	else
		print_with_color(:white, map[j, i])
	end

	# condições da recursão
	if (i+1 > sizei && j+1 > sizej) 
		print("\n\r") 
		return 0

	elseif(i+1 > sizei)
		print("\n\r")
		print_map_rec(map, j+1, sizej, 1, sizei)

	else print_map_rec(map, j, sizej, i+1, sizei)
		
	end
end

#Atualiza o jogo
function update(updateFrequency)
	while true
	sleep(1/updateFrequency)
	moveAllMap(function fun(j)
		randV = rand(Int) %2
		if(j>RIVER_DIVISION)
			if(randV ==0)
				return "@"
			else
				return ":"
			end
		else
			if(randV ==0)
				return "X"
			else
				return "~"
			end
		end
	end,
	m,STATIC_LINES,1,size(m,1))

	clear()
	print_with_color(:red, "    ##FROGGER##\t\tSTAGE: $stage \t\tSCORE: $score\n\r")
	print_map_rec(m, 1, size(m,1), 1, size(m,2))
	end

end

#move todas as linhas gerando objeto apartir da funcao do parametro
function moveAllMap(funGenerateOBJ,map, unmovableLines,j,sizej)
	while j in unmovableLines
		j+=1
	end
	if(j<sizej)
		newOBJ = funGenerateOBJ(j)
		if(j%2 == 0)
			moveLine(newOBJ,map,true,2,(size(m,2)-2),j)
		else
			moveLine(newOBJ,map,false,2,(size(m,2)-2),j)
		end
		moveAllMap(funGenerateOBJ,map,unmovableLines,j+1,sizej)
	else
		return
	end

end



#
function playerInput(moveMap)


end
# ========================================

global stage = 01
global score = 0
const global STATIC_LINES =[1,2,11,20,21] 
const global RIVER_DIVISION = 11
global m = map(x -> replace_matrix(eval_things(x), x), readdlm("map3.txt"))
clear()



print_with_color(:red, "    ##FROGGER##\t\tSTAGE: $stage \t\tSCORE: $score\n\r")
print_map_rec(m, 1, size(m,1), 1, size(m,2))


	@async update(2)




while true

	run(`stty raw`)	# stty raw faz com que, alem de nao dar echo no terminal,v
					# tambem libere o STDIN sem precisar dar enter,
					# ou seja, pega o primeiro caractere digitado e manda.

	# == getch ===============================
	# essa rotina permite que a gente
	# consiga pegar a tecla que o usuario
	# digita no teclado sem que a tecla 
	# de echo no terminal.

	user_input = '+'	# + eh um caractere qualquer que serve de placeholder
						# enquanto o usuario nao digita nada.
	    
	@async user_input = read(STDIN, Char)	# @async faz com que a chamada de read(),
											# que devolve o que foi digitado pelo teclado,
											# possa continuar no background, sem trancar 
											# a execucao do resto do game.
	# ========================================


	# == update ==============================
	# essa rotina serve para atualizar tudo que acontece no jogo
	while(user_input == '+')
		
		print("")	# precisa existir uma funcao que "faz algo"
					# para que o @async funcione
		

		if(user_input == 'a' || user_input == 'A')
			#move_frog(m, 1, 0, 0, 0)
			clear()
			print_with_color(:red, "    ##FROGGER##\t\tSTAGE: $stage \t\tSCORE: $score\n\r")
			print_map_rec(move_frog(m, 1, 0, 0, 0), 1, size(m,1), 1, size(m,2))

		elseif(user_input == 's' || user_input == 'S')
			#move_frog(m, 0, 0, 0, 1)
			score -= 10
			clear()
			print_with_color(:red, "    ##FROGGER##\t\tSTAGE: $stage \t\tSCORE: $score\n\r")
			print_map_rec(move_frog(m, 0, 0, 0, 1), 1, size(m,1), 1, size(m,2))

		elseif(user_input == 'd' || user_input == 'D')
			#move_frog(m, 0, 1, 0, 0)
			clear()
			print_with_color(:red, "    ##FROGGER##\t\tSTAGE: $stage \t\tSCORE: $score\n\r")
			print_map_rec(move_frog(m, 0, 1, 0, 0), 1, size(m,1), 1, size(m,2))
			
			

		elseif(user_input == 'w' || user_input == 'W')
			#move_frog(m, 0, 0, 1, 0)
			score += 10
			clear()
			print_with_color(:red, "    ##FROGGER##\t\tSTAGE: $stage \t\tSCORE: $score\n\r")
			print_map_rec(move_frog(m, 0, 0, 1, 0), 1, size(m,1), 1, size(m,2))

		elseif(user_input == 'q' || user_input == 'Q')
			
			game_over()



		end
	end
	# ========================================
end
#@async update(1)
    
    #while true
    	#sleep(0.5)
    	#moveLine("#",m,true,2,(size(m,2)-2),3)
    	#update_matrix
    

#end

