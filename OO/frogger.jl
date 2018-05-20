include("./characters/frog.jl")
include("./utils/map_utils.jl")

importall FrogClass
importall MapUtils

frog = Frog() 
map = Map() #usa construtor 'default'. Poderia ser passado um mapa especifico como parâmetro

map.show(map, frog)


# TODO Isolar em uma classe utils
function game_over()
	run(`stty cooked`)
	exit()
end

# TODO Isolar em uma classe utils
function clear()
	run(`clear`) # run(x) chama o comando x direto no terminal
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


	# == update ==============================
	# essa rotina serve para atualizar tudo que acontece no jogo
	while(user_input == '+')
		
		print("")	# precisa existir uma funcao que "faz algo"
					# para que o @async funcione

		if(user_input == 'a' || user_input == 'A')
			clear()
			frog.move(frog, 1, 0, 0, 0)
			map.show(map, frog)
		elseif(user_input == 's' || user_input == 'S')
			clear()
			frog.move(frog, 0, 0, 0, 1)
			map.show(map, frog)
		elseif(user_input == 'd' || user_input == 'D')
			clear()
			frog.move(frog, 0, 1, 0, 0)
			map.show(map, frog)
		elseif(user_input == 'w' || user_input == 'W')
			clear()
			frog.move(frog, 0, 0, 1, 0)
			map.show(map, frog)
		elseif(user_input == 'q' || user_input == 'Q')
			game_over()

		end
	end
	# ========================================
end