# == clear ===============================
# chama "clear" no terminal para
# limpar a tela

function clear()
	run(`clear`) # run(x) chama o comando x direto no terminal
end
# ========================================

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
			print("LEFT \n\r")	# quando stty raw ta ativado, temos que usar \n e \r 
								# para ir para uma nova linha (\n\r = CRLF)

		elseif(user_input == 's')
			print("DOWN \n\r")

		elseif(user_input == 'd')
			print("RIGHT \n\r")

		elseif(user_input == 'w')
			print("UP \n\r")

		elseif(user_input == 'q')
			print("QUIT GAME \n\r")
			run(`stty cooked`)
			exit()
		end
	end
	# ========================================
end














