while true
	Base.run(`clear`)
	for i in 1:24
		for j in 1:80
			print("O")
		end
		print("\n")
	end
	read(STDIN, Char)
end
