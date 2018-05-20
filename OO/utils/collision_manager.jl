module CollisionManagerClass

export CollisionManager

type CollisionManager
    check_for_colisions::Function #Public method

    function check_for_colisions(m, x, y)
        if(m[y[1], x[1]] == "@" || m[y[1], x[1]] == "X")
            game_over()
        elseif(m[y[1], x[1]] == "^")
            next_stage()
        end
    end

    function game_over() # Private 'method'
        print_with_color(:blue, "\t\t\t ****** QUIT GAME ******\n\r")
        run(`stty cooked`)
        exit()
    end

    function next_stage()
        print_with_color(:blue, "\t\t\t ****** WINNER ******\n\r")
        run(`stty cooked`)
        exit()
    end

    CollisionManager() = new(check_for_colisions)
end



end 