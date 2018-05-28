module TrunkClass

include("./floating_object.jl")
using .FloatingObjectClass

export Trunk # Public class

type Trunk <: FloatingObjectType # Extends enemy, that also extends character
    super::FloatingObject # 'Superclass'
	Trunk(x,y) = new(FloatingObject(x,y,'#',8)) # public
end



end
