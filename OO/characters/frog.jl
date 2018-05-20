module FrogClass

include("./character.jl")

export Frog, move # Public methods and class

type Frog <: Character ## 'inheritance'
	x_pos::Int
	y_pos::Int
end
Frog() = Frog(10,20) ## Way of doing default constructor
move(p::Frog, left, right, up, down)  = 
begin
	new_x_pos = p.x_pos + right - left
	new_y_pos = p.y_pos + down - up
	p.x_pos = new_x_pos
	p.y_pos = new_y_pos
end

end
