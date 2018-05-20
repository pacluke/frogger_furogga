
module MapUtils

export Map, show_map # Public methods and class

type Map 
    map::Array{Any,2}
end

Map() = Map(readdlm("map.txt"))

show_map(p::Map, frog) = 
begin
    m = p.map
	for j = 1:size(m,1)
        for i = 1:size(m,2)
            if(i == frog.x_pos && j == frog.y_pos)
                # TODO check for colision in the matrix
                print("W")
            else
                print(m[j,i])
            end
    	end
		print("\n\r")
	end
end



end


