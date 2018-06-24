module MovableObjectAbstractClass

abstract type MovableObjectAbstractClassType end  

MAX_SCREEN_X_SIZE = 80

function move(self::MovableObjectAbstractClassType)
    current_x_pos = self.super.get_x_pos(self.super)
    new_x_pos = current_x_pos - rand(1:max(self._max_speed))
    if new_x_pos <= 1
        self.super.set_x_pos(self.super, MAX_SCREEN_X_SIZE - self.super.get_size(self.super))
    else
        self.super.set_x_pos(self.super, new_x_pos)
    end
end

end