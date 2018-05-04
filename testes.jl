

### SEMPRE QUE UM DESSES REQUISITOS FOR PREENCHIDO,
### apague a descrição dele e ao lado do número, coloque a função ou funções que o representa,


"""
Recursos para a solução funcional:

1) Priorizar o uso de elementos imutáveis e funções puras (por exemplo, sempre precisar manipular listas,
criar uma nova e não modificar a original, seja por recursão ou através de funções de ordem maior).

2) Especificar e usar funções não nomeadas (ou lambda).

3) Especificar e usar funções que usem currying.

4) Especificar funções que utilizem pattern matching ao máximo, na sua definição.

5) Especificar e usar funções de ordem superior (maior) criadas pelo programador.

6) Usar funções de ordem maior prontas (p.ex., map, reduce, foldr/foldl ou similares).

7) Especificar e usar funções como elementos de 1ª ordem.

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






function exists(list, element)
	if(length(lst) == 0) return false
	else if(list[1] == element) return true
	else
		# deepcopy da lista para não modificar a original
		list02 = deepcopy(list)
		# deleta o primeiro elemento e chama a função com o resto da lista 
		deleteat!(list02, 1)
		return exists(list02, element)
end






# == move_frog ===============================
# recebe matriz que representa o mapa e as direcoes
# move e printa o mapa

function move_frog(m, left, right, up, down) 
	position = find(x -> x == "W", m) # Encontra posicao do sapo na matriz
	m[position] = "." # 'Remove' sapo daquela posição (TODO: deveria ser subsituido por o caracter de acordo com o devido 'terreno' que o sapo se encontra)
	y,x = ind2sub(m,position) # Converte posicao de indice em posicao representação por tupla
	new_x_pos = x + right - left
	new_y_pos = y + down - up
	# check_for_colisions() Chama metodo que verifica colisoes e etc...
	m[new_y_pos, new_x_pos] = "W"
	print_map(m)
	return m
end
# ========================================

# == clear ===============================
# chama "clear" no terminal para
# limpar a tela

function clear()
	run(`clear`) # run(x) chama o comando x direto no terminal
end

# == print_map ===============================
# Recebe matriz que representa o mapa do jogo
# Printa essa matriz
function print_map(map)
	clear()
	for j = 1:size(map,1)
		for i = 1:size(map,2)
			print(map[j,i])
		end
		print("\n\r") # quando stty raw ta ativado, temos que usar \n e \r 
		# para ir para uma nova linha (\n\r = CRLF)
	end
end
# ========================================

m = readdlm("map.txt")
print_map(m)

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

	# == update ==============================
	# essa rotina serve para atualizar tudo que acontece no jogo
	while(user_input == '+')
		
		print("")	# precisa existir uma funcao que "faz algo"
					# para que o @async funcione

		if(user_input == 'a')
			m = move_frog(m, 1, 0, 0, 0)

		elseif(user_input == 's')
			m = move_frog(m, 0, 0, 0, 1)

		elseif(user_input == 'd')
			m = move_frog(m, 0, 1, 0, 0)

		elseif(user_input == 'w')
			m = move_frog(m, 0, 0, 1, 0)

		elseif(user_input == 'q')
			print("QUIT GAME \n\r")
			run(`stty cooked`)
			exit()
		end
	end
	# ========================================
end














