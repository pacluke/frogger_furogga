include("./game_objects/game_object.jl")
include("./game_objects/frog.jl")
include("./game_objects/car.jl")
include("./game_objects/truck.jl")
include("./game_objects/trunk.jl")
include("./game_objects/enemy.jl")
include("./game_objects/turtles.jl")

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
enemy13 = Truck(20, 16)
enemy14 = Truck(31, 15)
enemy15 = Truck(61, 13)
enemy16 = Truck(43, 17)
enemy17 = Truck(3, 15)
enemy18 = Truck(2, 13)
enemy19 = Truck(1, 17)
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
floatingObject21 = Turtles(49, 9)
floatingObject22 = Turtles(10, 8)
floatingObject23 = Turtles(22, 7)
floatingObject24 = Turtles(5, 6)
floatingObject25 = Turtles(39, 9)
floatingObject26 = Turtles(20, 8)
floatingObject27 = Turtles(12, 7)
floatingObject28 = Turtles(2, 3)
floatingObject29 = Turtles(32, 6)
floatingObject30 = Turtles(12, 6)
floatingObject31 = Turtles(52, 6)
floatingObject32 = Turtles(66, 3)
floatingObject33 = Turtles(46, 2)
floatingObject34 = Turtles(76, 2)

game_objects = [enemy1, enemy2, enemy3, enemy4, 
enemy5, enemy6, enemy7, enemy8, enemy9, enemy10, enemy11, enemy12,
enemy13, enemy14, enemy15, enemy16, enemy17,enemy18,enemy19,
floatingObject1, floatingObject2, floatingObject3,
floatingObject4, floatingObject5 , floatingObject6, 
floatingObject7, floatingObject8, floatingObject9, floatingObject10,
floatingObject11, floatingObject12, floatingObject13,
floatingObject14, floatingObject15 , floatingObject16, 
floatingObject17, floatingObject18, floatingObject19, floatingObject20,
floatingObject21, floatingObject22, floatingObject23, floatingObject24,
floatingObject25, floatingObject26, floatingObject27, floatingObject28,
floatingObject29, floatingObject30, floatingObject31, floatingObject32,
floatingObject33, floatingObject34]


frog = Frog() 
map = Map{GameObjectClassType}(game_objects)

launcher = Launcher()

print_with_color(:red, "\n\n\t##FROGGER##\t\t Versão OO 1.0\n\n")
print_with_color(:cyan, "\t\tInstruções:")
print_with_color(:red, "\n\n\tA/a = ")
print_with_color(:cyan, "move para a esquerda\n")
print_with_color(:red, "\n\n\tW/w = ")
print_with_color(:cyan, "move para cima\n")
print_with_color(:red, "\n\n\tS/s = ")
print_with_color(:cyan, "move para baixo\n")
print_with_color(:red, "\n\n\tD/d = ")
print_with_color(:cyan, "move para a direita\n")
print_with_color(:red, "\n\n\tQ/q = ")
print_with_color(:cyan, "sai do jogo\n")

print_with_color(:white, "\n\t\tAperte enter para continuar...\n")

read(STDIN, Char)

launcher.init_game(launcher, map, frog)
launcher.start(launcher)