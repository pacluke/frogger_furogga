
include("./collision_manager.jl")

type Map{T} 
    _map::Array{Any,2}
    _game_objects::Array{T,1}
    get_game_objects::Function
    show::Function
    collision_manager::CollisionManager
    Map{T}(game_objects) where {T} = new(readdlm("map.txt"), game_objects, get_game_objects, show_map, CollisionManager())
end

function get_game_objects(self::Map)
    return self._game_objects
end

function show_map(self::Map, frog) 
    m = copy(self._map)
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