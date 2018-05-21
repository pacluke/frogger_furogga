
module MapUtils

include("./collision_manager.jl")

using .CollisionManagerClass

export Map # Public methods and class

type Map 
    map::Array{Any,2}
    show::Function
    collision_manager::CollisionManager
    function show_map(self::Map, frog, game_objects) 
        m = self.map
        # Put game_objects in matrix
        for j = 1:size(m,1)
            for i = 1:size(m,2)
                for object_index = 1:size(game_objects,1)
                    for k = 0:(game_objects[object_index].super.super.get_size(game_objects[object_index].super.super) - 1)
                        m[game_objects[object_index].super.super.get_y_pos(game_objects[object_index].super.super), game_objects[object_index].super.super.get_x_pos(game_objects[object_index].super.super)+k] = game_objects[object_index].super.super.get_symbol(game_objects[object_index].super.super)
                
                    end
                end
            end
        end

        for j = 1:size(m,1)
            for i = 1:size(m,2)
                if(i == frog.super.get_x_pos(frog.super) && j == frog.super.get_y_pos(frog.super))
                    self.collision_manager.check_for_colisions(string(m[j,i]))
                    print(frog.super.get_symbol(frog.super))
                else
                    print(m[j,i])
                end
            end
            print("\n\r")
        end
    end
    Map() = new(readdlm("map.txt"), show_map, CollisionManager())
end



end


