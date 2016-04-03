
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

class FairDice < Dice
	def initialize(sides,number)
		@sides = sides
		@number = number
		@counts = (1..sides).inject({}){|total,digit| total[digit] = 0; total}
	end

	def is_fair?
		p @counts
	end

	def roll
		rolls = []
		@number.times do
			rolls << (rand(@sides)+1)
		end 
		rolls.each do |x|
			@counts[x] += 1
		end
		return rolls
	end
end

class Square
	def initialize(id,type="neutral")
		@count = 0
		@id = id
		@type = type
		@orders = nil
	end

	def id
		return @id
	end

	def type
		return @type
	end

	def touch
		#p "touched! returning orders #{@orders}"
		return @orders
	end

	def land 
		@count+=1
	end

	def add_orders(orders)
		@orders = orders
	end

	def count 
		return @count
	end
end



class Stack
	def initialize(stack) 
		@count = 0
		@type = "Resource"
		@subtype = "basic"
		@orders = nil
		@stack = stack
		@stack.shuffle!
		@place = 0
	end

	def type
		return @type
	end

	def subtype
		return @subtype
	end

	def add_to_stack(orders)
		@stack << orders
	end

	def draw
		orders = @stack[@place]
		#p "finding orders #{orders} in #{@stack} at place #{@place}"
		@place += 1
		@stack.shuffle! if @place >= @stack.length 
		@place = 0 if @place >= @stack.length
		#p "returning orders #{orders} from #{subtype}"
		return orders
	end
end

class CommunityChest < Stack
	def initialize
		@count = 0
		@type = "Resource"
		@subtype = "CC"
		@orders = nil
		@stack = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,["goto","JAIL"],["goto","GO"]]
		@stack.shuffle!
		@place = 0
	end
end

class Chance < Stack
	def initialize
		@count = 0
		@type = "Resource"
		@subtype = "CH"
		@orders = nil
		@stack = [nil,nil,nil,nil,nil,nil,["goto","JAIL"],["goto","GO"],["goto","C1"],["goto","E3"],["goto","H2"],["goto","R1"],["next","R"],["next","R"],["next","U"],["back",3]]
		@stack.shuffle!
		@place = 0
	end
end

class Board
	def initialize
		@list = 0
		@squares = {}
		@dice = Dice.new(4,2)
		@dubcount = 0
		@place = 0
		@communitychest = CommunityChest.new
		@chance = Chance.new
	end
	
	def change_dice(dice)
		@dice = dice
	end

	def see_squares
		@squares
	end

	def add_square(square)
		@squares.length < 10 ? @squares["0"+@squares.length.to_s] = square : @squares[@squares.length.to_s] = square 
	end

	def go_to_spot(string)

		@place = string.to_i
		touch(@squares[string])
	end

	def find_next(type)
		#p "finding next #{type}"
		match = "neutral"
		until match == type do
			@place += 1
			@place = 0 if @place>= @squares.length
			match = @squares[place_string].type
		end
		touch @squares[place_string]
	end

	def go_to_id(id)
		#p "going to id #{id}"
		match = "ZERO"
		until match == id do
			@place += 1
			@place = 0 if @place >= @squares.length
			#p "#{@place},#{place_string}, #{@squares[place_string]}"
			match = @squares[place_string].id
		end
		touch(@squares[place_string])
		#p "went to #{id} at #{@place}"
	end

	def draw(type)
		orders = nil
		#p "drawing from #{type}"
		return orders = @chance.draw if type == "CH" 
		return orders = @communitychest.draw if type == "CC" 
		p "error! draw type #{type} not found!"
		return orders
	end

	def back(n)
		#p "going back #{n}"
		@place -= n
		touch(@squares[place_string])
	end

	def obey(orders)
		(@squares[place_string]).land if orders == nil
		return nil if orders == nil
		#p "obeying #{orders}"
		return obey(draw(orders[1])) if orders[0] == "draw"
		return go_to_id(orders[1]) if orders[0] == "goto"
		return find_next(orders[1]) if orders[0] == "next"
		return back(orders[1]) if orders[0] == "back"
		#p "error! - order type \"#{orders}\" not found"
		return nil
	end

	def touch(square)
		#p "touching #{square.id}"
		orders = square.touch
		#p "#{orders}"
		orders ? obey(orders) : square.land 
	end

	def place_string
		@place < 10 ? "0" + @place.to_s : @place.to_s
	end

	def roll
		#show_hit_counts
		#p "starting from place #{@place}"
		roll = @dice.roll
		#p "rolled #{roll}"
		roll[0] == roll[1] ? @dubcount += 1 : @dubcount = 0
		#p "doubles count = #{@dubcount}"
		if @dubcount == 3
			#p "too many doubles, going to jail"
			go_to_id("JAIL") 
			@dubcount = 0
		else
		@place += roll[0] + roll[1]
		#p "going to place #{@place}"
		@place -= @squares.length if @place >= @squares.length
		#p "adjusting to place #{@place}"
		touch(@squares[place_string])
		end
	end

	def show_hit_counts
		@squares.each do |key,value|
			p "#{key}:(#{value.id}) #{value.count}"
		end
	end
end



#sixsiders = Dice.new(6,2)
#p sixsiders.roll
monopoly = Board.new
go = Square.new("GO","go")
monopoly.add_square(go)
a1 = Square.new("A1")
monopoly.add_square(a1)
cc1 = Square.new("CC1","CC")
cc1.add_orders(["draw","CC"])
monopoly.add_square(cc1)
a2 = Square.new("A2")
monopoly.add_square(a2)
t1 = Square.new("T1","T")
monopoly.add_square(t1)
r1 = Square.new("R1","R")
monopoly.add_square(r1)

b1 = Square.new("B1")
monopoly.add_square(b1)

ch1 = Square.new("CH1","CH")
ch1.add_orders(["draw","CH"])
monopoly.add_square(ch1)

b2 = Square.new("B2")
monopoly.add_square(b2)

b3 = Square.new("B3")
monopoly.add_square(b3)

jail = Square.new("JAIL","JAIL")
monopoly.add_square(jail)

c1 = Square.new("C1")
monopoly.add_square(c1)

u1 = Square.new("U1","U")
monopoly.add_square(u1)

c2 = Square.new("C2")
monopoly.add_square(c2)

c3 = Square.new("C3")
monopoly.add_square(c3)

r2 = Square.new("R2","R")
monopoly.add_square(r2)

d1 = Square.new("D1",)
monopoly.add_square(d1)

cc2 = Square.new("CC2","CC")
cc2.add_orders(["draw","CC"])
monopoly.add_square(cc2)

d2 = Square.new("D2")
monopoly.add_square(d2)

d3 = Square.new("D3")
monopoly.add_square(d3)

fp = Square.new("FP","FP")
monopoly.add_square(fp)

e1 = Square.new("E1")
monopoly.add_square(e1)

ch2 = Square.new("CH2")
ch2.add_orders(["draw","CH"])
monopoly.add_square(ch2)

e2 = Square.new("E2")
monopoly.add_square(e2)

e3 = Square.new("E3")
monopoly.add_square(e3)

r3 = Square.new("R3","R")
monopoly.add_square(r3)

f1 = Square.new("F1")
monopoly.add_square(f1)

f2 = Square.new("F2")
monopoly.add_square(f2)

u2 = Square.new("U2","U")
monopoly.add_square(u2)

f3 = Square.new("F3","F3")
monopoly.add_square(f3)

g2j = Square.new("G2J","GOTO")
g2j.add_orders(["goto","JAIL"])
monopoly.add_square(g2j)

g1 = Square.new("G1")
monopoly.add_square(g1)

g2 = Square.new("G2")
monopoly.add_square(g2)

cc3 = Square.new("CC3")
cc3.add_orders(["draw","CC"])
monopoly.add_square(cc3)

g3 = Square.new("G3")
monopoly.add_square(g3)

r4 = Square.new("R4","R")
monopoly.add_square(r4)

ch3 = Square.new("CH3","CH")
ch3.add_orders(["draw","CH"])
monopoly.add_square(ch3)

h1 = Square.new("H2")
monopoly.add_square(h1)

t2 = Square.new("T2","T")
monopoly.add_square(t2)

h2 = Square.new("H2")
monopoly.add_square(h2)


test_dice = Dice.new(6,2)
count_hash={1=>0,2=>0,3=>0,4=>0,5=>0,6=>0}
1000000.times do 
	roll = test_dice.roll
	count_hash[roll[0]] += 1
	count_hash[roll[1]] += 1
end
monopoly.see_squares
10000000.times{monopoly.roll}
monopoly.show_hit_counts