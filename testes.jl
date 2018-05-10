

### SEMPRE QUE UM DESSES REQUISITOS FOR PREENCHIDO,
### apague a descrição dele e ao lado do número, coloque a função ou funções que o representa,


"""
Recursos para a solução funcional:

1) Priorizar o uso de elementos imutáveis e funções puras (por exemplo, sempre precisar manipular listas,
criar uma nova e não modificar a original, seja por recursão ou através de funções de ordem maior).

2) ---------------------------

3) ----------------------------

4) Especificar funções que utilizem pattern matching ao máximo, na sua definição.

5) ----------------------------

6) ----------------------------

7) ----------------------------

8) Usar recursão como mecanismo de iteração (pelo menos em funções de ordem superior que manipulem listas).

"""

### coisas que podem ajudar e serem usados de referencia depois:

## priorização de elementos imutáveis e funções puras - item 1 
# https://en.wikibooks.org/wiki/Introducing_Julia/Functions#Local_variables_and_changing_the_values_of_arguments

## funções anonimas (não nomeadas) - item 2
# https://en.wikibooks.org/wiki/Introducing_Julia/Functions#Anonymous_functions

## currying - item 3
# https://rosettacode.org/wiki/Currying#Julia

## pattern matching - item 4 (se voces não quiserem usar a biblioteca, o prof disse que a gente deve justificar o pq de nao usar no relatorio)
# http://kmsquire.github.io/Match.jl/latest/

## função de ordem superior - item 5 + funções de primeira ordem - item 7
# https://rosettacode.org/wiki/Higher-order_functions#Julia

## map, reduce, foldr/foldl - item 6
# https://en.wikibooks.org/wiki/Introducing_Julia/Functions#Map
# https://en.wikibooks.org/wiki/Introducing_Julia/Functions#Reduce_and_folding


# essa função serve pra manter o mesmo char quando o sapo andar 
function change_tile(y)
	if(y[1] > 2 && y[1] < 11)
		return "~"
	elseif(y[1] > 11 && y[1] < 20)
		return ":"
	else
		return "."
	end
end

# troca um numero por um caractere
function replace_matrix(fun, ch)
	if(fun(1)) return ":"
	elseif(fun(2)) return "@"
	elseif(fun(3)) return "~"
	elseif(fun(4)) return "X"
	else return ch
	end
end

function eval_things(value01)
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
function check_for_colisions(m, x, y)
	if(m[y[1], x[1]] == "@" || m[y[1], x[1]] == "X")
		game_over()
	elseif(m[y[1], x[1]] == "^")
		next_stage()
	end
end

# == move_frog ===============================
# recebe matriz que representa o mapa e as direcoes
# move e printa o mapa

function move_frog(m, left, right, up, down) 
	position = find(x -> x == "W", m) # Encontra posicao do sapo na matriz
	y,x = ind2sub(m,position) # Converte posicao de indice em posicao representação por tupla
	new_x_pos = x + right - left
	new_y_pos = y + down - up
	if(new_x_pos[1] > 1 && new_y_pos[1] > 1 && new_y_pos[1] < size(m, 1) && new_x_pos[1] < size(m, 2))
		check_for_colisions(m, new_x_pos, new_y_pos) # Chama metodo que verifica colisoes e etc...
		m[position] = change_tile(y) # 'Remove' sapo daquela posição (TODO: deveria ser subsituido por o caracter de acordo com o devido 'terreno' que o sapo se encontra)
		m[new_y_pos, new_x_pos] = "W"	    
	end
	return m
end
# ========================================


# == moveCars ===============================
# Recebe linha a ser movimentada
# Novo objeto para substituir a posicao que fica em branco
# Direçao a ser movimentados os carros
# True move para direita
function moveCars(streetObject, m, direction)
	if(isempty(m))
		return m
	end
	if(direction)
		newSO = m[1]
		deleteat!(m, 1)
		return append!(streetObject, moveCars(newSO,m,direction))
	end

end

# == clear ===============================
# chama "clear" no terminal para
# limpar a tela

function clear()
	run(`clear`) # run(x) chama o comando x direto no terminal
end

# == print_map ===============================
# Recebe matriz que representa o mapa do jogo
# Printa essa matriz
function print_map(map, stage, score)
	clear()
	print_with_color(:red, "    ##FROGGER##\t\tSTAGE: $stage \t\tSCORE: $score\n\r")
	for j = 1:size(map,1)
		for i = 1:size(map,2)
			if(map[j, i] == "~")
			    print_with_color(:cyan, map[j, i])

			elseif(map[j, i] == ":")			
				print(map[j, i])

			elseif(map[j, i] == "@" || map[j, i] == "X")
				print_with_color(:red, map[j, i])

			elseif(map[j, i] == "^")
				print_with_color(:magenta, map[j, i])

			elseif(map[j, i] == "W")
				print_with_color(:green, map[j, i])

			else
				print_with_color(:white, map[j, i])
			end
		end
		print("\n\r") # quando stty raw ta ativado, temos que usar \n e \r 
		# para ir para uma nova linha (\n\r = CRLF)
	end
end
# ========================================

global stage = 01
global score = 0

global m = map(x -> replace_matrix(eval_things(x), x), readdlm("map3.txt"))
print_map(m, stage, score)
@async begin
    
    # while true
    # 	sleep(0.5)
    # 	#update_matrix
    # end

end


while true

	run(`stty raw`)	# stty raw faz com que, alem de nao dar echo no terminal,
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
	print(" \n\n",m[1,y])

	moveCars('@', m[1], true)

	# == update ==============================
	# essa rotina serve para atualizar tudo que acontece no jogo
	while(user_input == '+')
		
		print("")	# precisa existir uma funcao que "faz algo"
					# para que o @async funcione

		if(user_input == 'a' || user_input == 'A')
			print_map(move_frog(m, 1, 0, 0, 0), stage, score)

		elseif(user_input == 's' || user_input == 'S')
			score -= 10
			print_map(move_frog(m, 0, 0, 0, 1), stage, score)

		elseif(user_input == 'd' || user_input == 'D')
			print_map(move_frog(m, 0, 1, 0, 0), stage, score)

		elseif(user_input == 'w' || user_input == 'W')
			score += 10
			print_map(move_frog(m, 0, 0, 1, 0), stage, score)

		elseif(user_input == 'q' || user_input == 'Q')
			game_over()

		# else

		end
	end
	# ========================================
end

