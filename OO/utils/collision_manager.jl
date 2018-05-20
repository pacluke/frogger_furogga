module CollisionManagerClass

export CollisionManager

type CollisionManager
    check_for_colisions::Function #Public method

    function check_for_colisions(ground)
        if(ground == "@" || ground == "X" || ground == "~")
            game_over()
        elseif(ground == "^")
            next_stage()
        end
    end

    function game_over() # Private 'method'
        run(`clear`)
        print_with_color(:blue, "\t\t\t ****** QUIT GAME ******\n\r")
        run(`stty cooked`)
        exit()
    end

    function next_stage() # Private 'method'
        run(`clear`)
        print_with_color(:blue, "\t\t\t ****** WINNER ******\n\r")
        run(`stty cooked`)
        exit()
    end

    CollisionManager() = new(check_for_colisions)
end



end 