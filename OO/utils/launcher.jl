module LauncherClass

include("./controller.jl")

using .ControllerClass

export Launcher

type Launcher
	start::Function # public
	function start(mainCharacter, map, game_objects)
        controller = Controller()
        map.show(map, mainCharacter, game_objects)

        while true
    
            run(`stty raw`)	# stty raw faz com que, alem de nao dar echo no terminal,
                            # tambem libere o STDIN sem precisar dar enter,
                            # ou seja, pega o primeiro caractere digitado e manda.
            controller.capture_keyboard(mainCharacter, map, game_objects)
        end
    end
	Launcher() = new(start) # public
end




end