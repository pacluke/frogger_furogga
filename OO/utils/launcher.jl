
include("./controller.jl")

abstract type LauncherClassType end  

type Launcher <: LauncherClassType
    start::Function # public
    _controller::ControllerClassType
	Launcher() = new(start, Controller()) # public
end

function start(self::LauncherClassType, mainCharacter, map)
    map.show(map, mainCharacter)

    while true

        run(`stty raw`)	# stty raw faz com que, alem de nao dar echo no terminal,
                        # tambem libere o STDIN sem precisar dar enter,
                        # ou seja, pega o primeiro caractere digitado e manda.
        self._controller.capture_keyboard(self._controller, mainCharacter, map)
    end
end