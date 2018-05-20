
module MapUtils

export Map # Public methods and class

type Map 
    map::Array{Any,2}
    show::Function
    function show_map(self::Map, frog) 
        m = self.map
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
    Map() = new(readdlm("map.txt"), show_map)
end




end


