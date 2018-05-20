module CarClass

include("./enemy.jl")
using .EnemyClass

export Car # Public class

type Car <: EnemyClassType # Extends enemy, that also extends character
    super::Enemy # 'Superclass'
	Car(x,y) = new(Enemy(x,y,'@')) # public
end



end
