module FloatingObjectClass

include("./game_object.jl")

using .GameObjectClass

MAX_SCREEN_X_SIZE = 80

abstract type FloatingObjectType  <: GameObjectClassType end  

export FloatingObject, FloatingObjectType # Public class

type FloatingObject <: GameObjectClassType ## Extends Character class, so it has get_symbol method for example
	super::GameObject # 'Superclass'
    move::Function # Public method
	FloatingObject(x, y, symbol, size) = new(GameObject(x, y, symbol, size), move)
end

function move(self::FloatingObject)
	current_x_pos = self.super.get_x_pos(self.super)
	new_x_pos = current_x_pos - rand(0:2)
	if new_x_pos <= 1
		self.super.set_x_pos(self.super, MAX_SCREEN_X_SIZE - self.super.get_size(self.super))
	else
		self.super.set_x_pos(self.super, new_x_pos)
	end
end


end
