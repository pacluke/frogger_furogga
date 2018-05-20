include("./game_objects/frog.jl")
include("./game_objects/car.jl")
include("./game_objects/trunk.jl")

include("./utils/map_utils.jl")
include("./utils/launcher.jl")


importall FrogClass
importall CarClass
importall MapUtils
importall LauncherClass
importall TrunkClass


enemy1 = Car(15, 18)
enemy2 = Car(50, 19)
enemy3 = Car(61, 12)
floatingObject1 = Trunk(20, 10)
floatingObject2 = Trunk(10, 9)
floatingObject3 = Trunk(10, 8)
game_objects = [enemy1, enemy2, enemy3, floatingObject1, floatingObject2, floatingObject3]


frog = Frog() 
map = Map() #usa construtor 'default'. Poderia ser passado um mapa especifico como parâmetro

launcher = Launcher()

launcher.start(frog, map, game_objects)