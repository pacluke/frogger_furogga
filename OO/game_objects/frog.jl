module FrogClass

include("./game_object.jl")

using .GameObjectClass

abstract type FrogClassType  <: GameObjectClassType end  


export Frog, FrogClassType # Public class

type Frog <: GameObjectClassType ## Extends Character class, so it has get_symbol method for example
	super::GameObject # 'Superclass'
    walk::Function # Public method
	Frog() = new(GameObject(10,20,'W', 1), walk)
end

function walk(self::Frog, left, right, up, down)
	new_x_pos = self.super.get_x_pos(self.super) + right - left
	new_y_pos = self.super.get_y_pos(self.super) + down - up
	self.super.set_x_pos(self.super, new_x_pos)
	self.super.set_y_pos(self.super, new_y_pos)
end


end
