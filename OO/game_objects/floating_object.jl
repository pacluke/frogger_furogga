
include("./movable_object.jl")
include("./game_object.jl")

abstract type FloatingObjectType  <: MovableObjectAbstractClassType end  

type FloatingObject <: FloatingObjectType 
	super::GameObject # 'Superclass'
    move::Function # Public method
	FloatingObject(x, y, symbol, size) = new(GameObject(x, y, symbol, size), move)
end

