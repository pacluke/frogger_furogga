
include("./movable_object.jl")
include("./game_object.jl")

abstract type EnemyClassType   <: MovableObjectAbstractClassType end  

type Enemy  <: EnemyClassType 
    super::GameObject # 'Superclass'
    _max_speed::Int
    move::Function # Public method
	Enemy(x, y, symbol, size, speed) = new(GameObject(x, y, symbol, size), speed, move) # public
end

function move(self::Enemy)
    current_x_pos = self.super.get_x_pos(self.super)
    new_x_pos = current_x_pos - rand(1:max(self._max_speed))
    if new_x_pos <= 1
        self.super.set_x_pos(self.super, MAX_SCREEN_X_SIZE - self.super.get_size(self.super))
    else
        self.super.set_x_pos(self.super, new_x_pos)
    end
end

