
include("./floating_object.jl")

abstract type TurtlesClassType  <: FloatingObjectType end  

type Turtles <: TurtlesClassType 
    super::FloatingObject # 'Superclass'
	Turtles(x,y) = new(FloatingObject(x,y,'O',3)) # public
end
