module FloatingObjectClass

include("./game_object.jl")

using .GameObjectClass

abstract type FloatingObjectType  <: GameObjectClassType end  


export FloatingObject, FloatingObjectType # Public class

type FloatingObject <: GameObjectClassType ## Extends Character class, so it has get_symbol method for example
	super::GameObject # 'Superclass'
    move::Function # Public method
	Frog() = new(GameObject(10,20,'W'), move)
end

function move(self::FloatingObject, left, right, up, down)
	# TODO 
end


end
