
include("./enemy.jl")

abstract type CarClassType  <: EnemyClassType end  

type Car <: CarClassType 
    super::Enemy # 'Superclass'
	Car(x,y) = new(Enemy(x,y,'@',2,2)) # public
end

