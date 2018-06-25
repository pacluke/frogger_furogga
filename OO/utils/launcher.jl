
include("./controller.jl")

export Launcher

type Launcher
	start::Function # public
	Launcher() = new(start) # public
end

function start(mainCharacter, map)
    controller = Controller()
    map.show(map, mainCharacter)

    while true

        run(`stty raw`)	# stty raw faz com que, alem de nao dar echo no terminal,
                        # tambem libere o STDIN sem precisar dar enter,
                        # ou seja, pega o primeiro caractere digitado e manda.
        controller.capture_keyboard(mainCharacter, map)
    end
end