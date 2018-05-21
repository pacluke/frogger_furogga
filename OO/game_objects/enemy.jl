module EnemyClass

include("./game_object.jl")

using .GameObjectClass

abstract type EnemyClassType  <: GameObjectClassType end  

export Enemy, EnemyClassType  # Public class

type Enemy <: GameObjectClassType ## extends Abstract 'Class'
    super::GameObject # 'Superclass'
    move::Function # Public method
	Enemy(x, y, symbol, size) = new(GameObject(x, y, symbol, size), move) # public
end

function move(self::Enemy)
    # TODO implements enemy movement
end


end
