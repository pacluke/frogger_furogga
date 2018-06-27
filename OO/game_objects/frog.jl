
include("./game_object.jl")

abstract type FrogClassType  <: GameObjectClassType end  

MAX_SCREEN_X_SIZE = 80


type Frog <: FrogClassType 
	super::GameObject # 'Superclass'
    walk::Function # Public method
	Frog() = new(GameObject(10,20,'W', 1), walk)
end

function walk(self::Frog, left, right, up, down)
	new_x_pos = self.super.get_x_pos(self.super) + right - left
	new_y_pos = self.super.get_y_pos(self.super) + down - up
	if new_x_pos > 1 && new_x_pos < MAX_SCREEN_X_SIZE
		self.super.set_x_pos(self.super, new_x_pos)
	end
	if new_y_pos < 21
		self.super.set_y_pos(self.super, new_y_pos)
	end
end

