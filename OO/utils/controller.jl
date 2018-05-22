module ControllerClass


export Controller


type Controller
	capture_keyboard::Function # public
	Controller() = new(capture_keyboard) # public
end

function capture_keyboard(char, map, game_objects)

    user_input = '+'	# + eh um caractere qualquer que serve de placeholder
    # enquanto o usuario nao digita nada.

    @async user_input = read(STDIN, Char)	# @async faz com que a chamada de read(),
                        # que devolve o que foi digitado pelo teclado,
                        # possa continuar no background, sem trancar 
                        # a execucao do resto do game.
    # ========================================
    
    @async update_screen(map, char, game_objects)

    @async move_objects(game_objects)

    # essa rotina serve para atualizar tudo que acontece no jogo
    while(user_input == '+')
         
        print("")	# precisa existir uma funcao que "faz algo"
                    # para que o @async funcione
     
        if(user_input == 'a' || user_input == 'A')
            char.move(char, 1, 0, 0, 0)
        elseif(user_input == 's' || user_input == 'S')
            char.move(char, 0, 0, 0, 1)
        elseif(user_input == 'd' || user_input == 'D')
            char.move(char, 0, 1, 0, 0)
        elseif(user_input == 'w' || user_input == 'W')
            char.move(char, 0, 0, 1, 0)
        elseif(user_input == 'q' || user_input == 'Q')
            run(`stty cooked`)
            exit()
        end
    end
end

function update_screen(map, char, game_objects)  #private function
    run(`clear`)
    map.show(map, char, game_objects)
end

function move_objects(game_objects)  #private function
    for i=1:size(game_objects, 1)
        game_objects[i].super.move(game_objects[i].super)
    end
end

end