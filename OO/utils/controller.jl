module ControllerClass

export Controller


type Controller
	capture_keyboard::Function # public
	function capture_keyboard(char, map, enemies)

       
    
        user_input = '+'	# + eh um caractere qualquer que serve de placeholder
        # enquanto o usuario nao digita nada.
    
        @async user_input = read(STDIN, Char)	# @async faz com que a chamada de read(),
                            # que devolve o que foi digitado pelo teclado,
                            # possa continuar no background, sem trancar 
                            # a execucao do resto do game.
        # ========================================
    
        # essa rotina serve para atualizar tudo que acontece no jogo
        while(user_input == '+')
            
            print("")	# precisa existir uma funcao que "faz algo"
                        # para que o @async funcione
    
            if(user_input == 'a' || user_input == 'A')
                run(`clear`)
                char.move(char, 1, 0, 0, 0)
                map.show(map, char, enemies)
            elseif(user_input == 's' || user_input == 'S')
                run(`clear`)
                char.move(char, 0, 0, 0, 1)
                map.show(map, char, enemies)
            elseif(user_input == 'd' || user_input == 'D')
                run(`clear`)
                char.move(char, 0, 1, 0, 0)
                map.show(map, char, enemies)
            elseif(user_input == 'w' || user_input == 'W')
                run(`clear`)
                char.move(char, 0, 0, 1, 0)
                map.show(map, char, enemies)
            elseif(user_input == 'q' || user_input == 'Q')
                run(`stty cooked`)
                exit()
            end
        end
    end
	Controller() = new(capture_keyboard) # public
end


end