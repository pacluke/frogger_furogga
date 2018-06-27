
include("./controller.jl")

abstract type LauncherClassType end  

type Launcher <: LauncherClassType
    start::Function # public
    init_game::Function
    _controller::ControllerClassType
    _map::Any
    _player::Any
	Launcher() = new(start, init_game, Controller(), nothing, nothing) # public
end

function init_game(self::LauncherClassType, map, player)
    self._map = map
    self._player = player
    self._map.show(self._map, self._player)
end

function start(self::LauncherClassType)

    while true

        run(`stty raw`)	# stty raw faz com que, alem de nao dar echo no terminal,
                        # tambem libere o STDIN sem precisar dar enter,
                        # ou seja, pega o primeiro caractere digitado e manda.
        self._controller.capture_keyboard(self._controller, self._player, self._map)
    end
end