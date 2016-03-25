class Square
	def initialize(type)
		@count = 0
		@type = type
		@orders = nil
	end

	def touch
		return @orders
	end

	def land 
		@count+=1
	end

	def add_orders(orders)
		@orders = orders
	end
end

class Resource < Square
	def initialize(type,squaretype)
	end
	#Finish writing this!
end

class Stack
	def initialize(stack) 
		@count = 0
		@type = "Resource"
		@orders = nil
		@stack = stack
		@stack.shuffle
		@place = 0
	end

	def add_to_stack(orders)
		@stack << orders
	end

	def draw
		orders = @stack[place]
		place += 1
		@stack.shuffle if place >= @stack.length 
		return orders
	end
end


class Board
	def initialize
		@list = 0
		@squares = {}
		@dice = Dice.new(6,2)
		@dubcount = 0
		@place = 0
	end
	
	def change_dice(dice)
		@dice = dice
	end

	def add_square(square)
		squares.length < 10 ? squares["0"+squares.length.to_s] = square : squares[squares.length.to_s] = square 
	end

	def go_to(string)
		@place = string.to_i
		touch(@squares[string])
	end

	def find_next(type)
		if 
	end

	def obey(orders)
		
	end

	def touch(square)
		orders = square.touch
		square.orders? obey(orders) : square.land 
	end

	def place_string
		@place < 10 ? return "0" + @place.to_s : @place.to_s
	end

	def roll
		roll = @dice.roll
		if roll[0] == roll[1]
			@dubcount += 1
			go_to("Jail")
		else
		@place += roll[0] + roll[1]
		@place -= @squares.length if @place >= @squares.length
		touch(@squares[place_string])
	end

end


class Dice
	def initialize(sides,number)
		@sides = sides
		@number = number
	end

	def roll
		rolls = []
		@number.times do
			rolls << (rand(@sides)+1)
		end 
		return rolls
	end
end

sixsiders = Dice.new(6,2)
p sixsiders.roll