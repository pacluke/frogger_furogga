module CarClass

include("./enemy.jl")
using .EnemyClass

export Car # Public class

type Car <: EnemyClassType # Extends enemy, that also extends game object
    super::Enemy # 'Superclass'
	Car(x,y) = new(Enemy(x,y,'@',2,2)) # public
end



end
