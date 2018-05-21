include("./game_objects/frog.jl")
include("./game_objects/car.jl")
include("./game_objects/truck.jl")
include("./game_objects/trunk.jl")

include("./utils/map_utils.jl")
include("./utils/launcher.jl")


importall FrogClass
importall CarClass
importall TruckClass
importall MapUtils
importall LauncherClass
importall TrunkClass


enemy1 = Car(15, 18)
enemy2 = Car(50, 19)
enemy3 = Car(61, 12)
enemy4 = Truck(61, 18)
floatingObject1 = Trunk(20, 9)
floatingObject2 = Trunk(40, 8)
floatingObject3 = Trunk(30, 7)
floatingObject4 = Trunk(20, 6)
floatingObject5 = Trunk(10, 5)
floatingObject6 = Trunk(50, 4)
floatingObject7 = Trunk(10, 3)
floatingObject8 = Trunk(65, 8)
floatingObject9 = Trunk(5, 9)
floatingObject10 = Trunk(15, 10)
game_objects = [enemy1, enemy2, enemy3, enemy4, floatingObject1, floatingObject2, floatingObject3,
floatingObject4, floatingObject5 , floatingObject6, floatingObject7, floatingObject8, floatingObject9, floatingObject10]


frog = Frog() 
map = Map() #usa construtor 'default'. Poderia ser passado um mapa especifico como parâmetro

launcher = Launcher()

launcher.start(frog, map, game_objects)