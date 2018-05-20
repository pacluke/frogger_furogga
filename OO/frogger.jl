include("./game_objects/frog.jl")
include("./game_objects/car.jl")

include("./utils/map_utils.jl")
include("./utils/launcher.jl")


importall FrogClass
importall CarClass
importall MapUtils
importall LauncherClass


enemy1 = Car(18, 15)
enemy2 = Car(12, 19)
enemy3 = Car(14, 10)
enemies = [enemy1, enemy2, enemy3]

frog = Frog() 
map = Map() #usa construtor 'default'. Poderia ser passado um mapa especifico como parâmetro

map.show(map, frog, enemies)

launcher = Launcher()

launcher.start(frog, map, enemies)