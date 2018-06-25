
abstract type GameObjectClassType end  

type GameObject <: GameObjectClassType
	_x_pos::Int # private denoted by the underscore '_'
	_y_pos::Int # private denoted by the underscore '_'
	_symbol::Char  # private denoted by the underscore '_'
	_size::Int # private denoted by the underscore '_'
	get_symbol::Function # Public
	get_size::Function # Public
	get_x_pos::Function # Public
	get_y_pos::Function # Public
	set_x_pos::Function # Public
	set_y_pos::Function # Public
	GameObject(x, y, symbol, size) = new(x, y, symbol, size, get_symbol, get_size, get_x_pos, get_y_pos, set_x_pos, set_y_pos) # public constructor
end

function get_symbol(self::GameObjectClassType)
	return self._symbol
end

function get_size(self::GameObjectClassType)
    return self._size;
end

function get_x_pos(self::GameObjectClassType)
	return self._x_pos
end

function get_y_pos(self::GameObjectClassType)
	return self._y_pos
end

function set_x_pos(self::GameObjectClassType, x::Int)
	if x < 0
		throw("Error! Position cant be negative")
	end	
	self._x_pos = x
end

function set_y_pos(self::GameObjectClassType, y::Int)
	if y < 0
		throw("Error! Position cant be negative")
	end	
	self._y_pos = y
end
