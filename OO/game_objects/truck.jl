module TruckClass

include("./enemy.jl")
using .EnemyClass

export Truck # Public class

type Truck <: EnemyClassType # Extends enemy, that also extends character
    super::Enemy # 'Superclass'
	Truck(x,y) = new(Enemy(x,y,'@',4)) # public
end



end
