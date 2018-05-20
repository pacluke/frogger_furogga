include("./characters/frog.jl")
include("./utils/map_utils.jl")
include("./utils/launcher.jl")

importall FrogClass
importall MapUtils
importall LauncherClass

frog = Frog() 
map = Map() #usa construtor 'default'. Poderia ser passado um mapa especifico como parâmetro

map.show(map, frog)

launcher = Launcher()

launcher.start(frog, map)