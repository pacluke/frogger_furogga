include("./game_objects/game_object.jl")
include("./game_objects/frog.jl")
include("./game_objects/car.jl")
include("./game_objects/truck.jl")
include("./game_objects/trunk.jl")
include("./game_objects/enemy.jl")

include("./utils/map_utils.jl")
include("./utils/launcher.jl")


enemy1 = Car(15, 18)
enemy2 = Car(50, 19)
enemy3 = Car(6, 12)
enemy4 = Car(30, 14)
enemy5 = Car(50, 16)
enemy6 = Car(63, 19)
enemy7 = Car(3, 19)
enemy8 = Car(30, 14)
enemy9 = Truck(40, 16)
enemy10 = Truck(21, 15)
enemy11 = Truck(41, 13)
enemy12 = Truck(73, 17)
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
floatingObject11 = Trunk(10, 9)
floatingObject12 = Trunk(30, 8)
floatingObject13 = Trunk(45, 7)
floatingObject14 = Trunk(15, 6)
floatingObject15 = Trunk(66, 5)
floatingObject16 = Trunk(13, 4)
floatingObject17 = Trunk(23, 3)
floatingObject18 = Trunk(33, 8)
floatingObject19 = Trunk(22, 9)
floatingObject20 = Trunk(44, 10)
game_objects = [enemy1, enemy2, enemy3, enemy4, 
enemy5, enemy6, enemy7, enemy8, enemy9, enemy10, enemy11, enemy12,
floatingObject1, floatingObject2, floatingObject3,
floatingObject4, floatingObject5 , floatingObject6, 
floatingObject7, floatingObject8, floatingObject9, floatingObject10,
floatingObject11, floatingObject12, floatingObject13,
floatingObject14, floatingObject15 , floatingObject16, 
floatingObject17, floatingObject18, floatingObject19, floatingObject20]


frog = Frog() 
map = Map{GameObjectClassType}(game_objects)

launcher = Launcher()

launcher.start(frog, map)