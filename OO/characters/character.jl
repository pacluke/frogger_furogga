
abstract type Character end  # Pode ser considerada uma classe abstrata
move(p::Character) = print("You should implement the movement in the concreate 'class'")
character_pos(p::Character)  =
begin
	@printf "Character position: x: %d y: %d \n" p.x_pos p.y_pos
end