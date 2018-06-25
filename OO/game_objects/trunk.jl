
include("./floating_object.jl")

abstract type TrunkClassType  <: FloatingObjectType end  

type Trunk <: TrunkClassType 
    super::FloatingObject # 'Superclass'
	Trunk(x,y) = new(FloatingObject(x,y,'#',8)) # public
end
