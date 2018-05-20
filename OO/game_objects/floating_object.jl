module FloatingObjectClass

include("./game_object.jl")

using .GameObjectClass

abstract type FloatingObjectType  <: GameObjectClassType end  


export FloatingObject, FloatingObjectType # Public class

type FloatingObject <: GameObjectClassType ## Extends Character class, so it has get_symbol method for example
	super::GameObject # 'Superclass'
    move::Function # Public method
	FloatingObject(x, y, symbol) = new(GameObject(x, y, symbol), move)
end

function move(self::FloatingObject)
	# TODO implement floating object movement
end


end
