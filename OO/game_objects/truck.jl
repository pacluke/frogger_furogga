include("./enemy.jl")

abstract type TruckClassType   <: EnemyClassType end  

type Truck <: TruckClassType 
    super::Enemy # 'Superclass'
	Truck(x,y) = new(Enemy(x,y,'@',4,4)) # public
end

