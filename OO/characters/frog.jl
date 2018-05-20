module FrogClass

include("./character.jl")

export Frog # Public class

type Frog <: Character ## 'inheritance'
	x_pos::Int # public
	y_pos::Int # public
	move::Function # public

	function move(self::Frog, left, right, up, down)
		new_x_pos = self.x_pos + right - left
		new_y_pos = self.y_pos + down - up
		self.x_pos = new_x_pos
		self.y_pos = new_y_pos
	end
	
	Frog() = new(10,20, move) # public
end




end
