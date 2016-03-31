#gotta add a splat but let's do it
def findmults (range, one, two)
	a = 1
	numbers = []
	while(a<range) do
		if (a%one == 0 or a%two == 0)
			numbers<<a
		end
		a+=1
	end
	numbers
end

def sum(array)
	array.inject(:+)
end

def makefib(limit)
	fibs = [1,2]
	
	#do not exceed not strictly less so inclusive
	while(fibs[-1]<=limit) do
		fibs<<fibs[-1] + fibs[-2]
		p fibs
	end
	fibs.pop
	fibs
end

#genericize this to make it take any conditional - review passing blocks and that shit
def striptoeven(oldarray)
	newarray = []
	oldarray.each{|x| newarray<<x if x%2==0}
	newarray
end

def isprime(int)
	prime = true
	for i in 2..(int/2).to_int
		if int%i == 0 then
			prime = false
			break
		end
	end
	prime
end

def primesupto(int)
	primes = []
	for i in 2..int
		primes << i if isprime(i)
	end
	primes
end

def findfactors(int)
	array = []
	for i in 2..(int/2).to_int
		array << i if int%i == 0
	end
	array
end



def nofactor(array,int)
end

def breaktoprime(int)
	total = int
	count = 2
	array = []

	while count <= total do
		if total%count == 0 
			array << count
			total = total / count
		else 
			count+=1
		end
	end
	return array
end

def number_divisors(int)
	total = int
	count = 2
	product = 1
	this = 0
	while count <= total do
		if total%count == 0
			this += 1
			total = total / count
			product *= (this + 1) if count > total
		else
			count += 1
			product *= (this + 1)
			this = 0
		end
	end
	return product
end



def is_palin(int)
	int.to_s.reverse == int.to_s
end


def iterate_products
#doesn't work as advertised
	a = 999
	
	while(a >= 100) do
		b = 999
		while (a<=b) do
			#p a
			#p b
			#p a*b
			p "PALINDROME!#{a} x #{b} = #{a*b}" if is_palin(a*b)
			b-= 1
		end
		a -= 1
	end
end

def evenlydivisible 
	primes = 2*3*5*7*11*13*17*19
	max = 2*3*4*5*6*7*8*9*10*11*12*13*14*15*16*17*18*19*20
	a = primes
	while (a<max)
		clean = true
		for i in 1..20
			clean = false if a%i > 0
		end
		p a 
		p "#{a} is clean!" if clean
		return a if clean 
		a+= primes
	end
end

def sumsquarediff(int)
sumsq = 0

for i in 0..int
	sumsq+= i * i
end
a=*(1..int) 
sqsum = sum(a)**2
p "Square of sum (#{sqsum}) minus sum of squares (#{sumsq}) equals #{sqsum-sumsq}"
end

def nthprime(int)
	a = 1
	p = 0
	while(p<int) do
		a+=1
		p+=1 if isprime(a)
	end
	p a
end

def primesieve(int)
	primes = [2]
	for i in 2..int
		isp = true
		for a in 0..primes.length-1
			if i%primes[a] == 0
				isp = false
				p "breaking"
				break
			end
			p "broken"
		end
		primes << i if isp
		p "prime added" if isp
		p primes
	end
end

def primesupto(int)
	primes = [2]
	count = 2
	while primes.length <= int
		isp = true
		for a in 0..primes.length-1
			if count%primes[a] == 0
				isp = false
				break
			end
		end
		primes << count if isp
		count += 1
	end
	p primes
	p sum(primes)
end

def primesupto_v2(int)
	primes = [2]
	count = 2
	while count <= int
		isp = true
		for a in 0..primes.length-1
			if count%primes[a] == 0
				isp = false
				break
			end
		end
		primes << count if isp
		count += 1
	end
	p primes
	p sum(primes)
	return primes
end


def biggestproduct(string)
	candidates = []

	for i in 0..string.length-13
	#searches through full range of 13-consecutive character combinations
		segment = string[i..i+12]
		#adds a candidate only if we know zero is not a part of it
		candidates << segment if segment.index('0') == nil
	end
	#iterates through all those combos
	highest = 1
	greatest = 1

	candidates.each do |substring|
		product = substring.split("").map{|s| s.to_i}.inject{|sum,n| sum * n}
		p substring
		p product
		if(product > highest) then
			highest = product
			greatest = substring
		end
		p "Highest is #{highest} string is #{greatest}"
	end

end
def loadtriangle67
	triangle = File.open("triangle.txt","r")
	a = []
	triangle.each_line do |line|
		line = line.split(" ")
		line.map!{|x|x.to_i}
		a << line
	end
	return a
end

def loadtriangle18
	triangle = File.open("triangle2.txt","r")
	a = []
	triangle.each_line do |line|
		line = line.split(" ")
		line.map!{|x|x.to_i}
		a << line
	end
	p a
	return a
end
def iterate_tri(tri)
	tri.reverse!
	tri[0].map!{|x|[]<<x}
	for i in 1..tri.length-1
		currentrow = tri[i]
		prevrow = tri[i-1]
		for j in 0..currentrow.length-1
			if sum(prevrow[j]) > sum(prevrow[j+1])
				p "left path victor! #{prevrow[j]}"
				currentrow[j] = prevrow[j] + [] << currentrow[j]
			else
				p "right path victor! #{prevrow[j+1]}"
				currentrow[j] = prevrow[j+1] + [] << currentrow[j]
			end
		end
		tri[i] = currentrow
	end
	p tri.last
	p sum(tri.last[0])
end

def pythag9
	for c in 335..499
		for b in (1000-c)/2+1..c-1
			a = 1000-c-b
			p a*b*c if a**2 + b**2 == c**2
		end
	end
end

def sieveupto(max)
	valid = (0..max).to_a
	valid[0] = valid[1] = nil
	for i in 0..(max**0.5) do
		next unless valid[i]
		(i**2).step(max,i) do |x|
			valid[x]=nil
		end
	end
	valid.compact!
	return valid
end

def full_sieveupto(max)
	valid = (0..max).to_a
	valid[0] = valid[1] = nil
	for i in 0..(max**0.5) do
		next unless valid[i]
		(i**2).step(max,i) do |x|
			valid[x]=nil
		end
	end
	return valid
end

def primesupto_v3(int)
	primes = []
	composites = []
	i = 2 
	while i < int
		if composites.index(i) == nil
			primes << i
			for n in i..int/i
				composites << i * n
			end
		end
		i += 1
	end
	return primes
end

def numsupto(int)

	for i in 0..int
		i += 1
	end
end

def loadfile(path)
	file = File.open(path, "r") 
	a = []
	file.each_line do |line|
	line = line.split(" ")
	line.map!{|x|x.to_i}
	a << line
	end
	
	p a
	return a
end

def loadtext(path)
	file = File.open(path, "r") 
	a = []
	file.each_line do 
	a << line
	end
	p a
	return a
end


def highest_in_grid(grid)
	highest = 0
	for row in 0..grid.length-1
		for column in 0..grid[row].length-1
			next if grid[row][column] == 0
			if row >= 3
				#"up" - check to make sure is enough space
				product = grid[row][column]*grid[row-1][column]*grid[row-2][column]*grid[row-3][column]
				p "new highest! #{product}, #{grid[row][column]} at #{row} by #{column} up!" if product > highest
				highest = product if product > highest
			end
			if column >= 3
				#back
				product = grid[row][column]*grid[row][column-1]*grid[row][column-2]*grid[row][column-3]
				p "new highest!  #{product}, #{grid[row][column]} at #{row} by #{column} back!" if product > highest
				highest = product if product > highest
			end
			if column >=3 and row >=3
				product = grid[row][column]*grid[row-1][column-1]*grid[row-2][column-2]*grid[row-3][column-3]
				p "new highest! #{product}, #{grid[row][column]} at #{row} by #{column} back and up!" if product > highest
				highest = product if product > highest
			end
			if column >= 3 and row <= grid.length - 4
				product = grid[row][column]*grid[row+1][column-1]*grid[row+2][column-2]*grid[row+3][column-3]
				p "new highest! #{product}, #{grid[row][column]} at #{row} by #{column} back and down!" if product > highest
				highest = product if product > highest
				
			end
		end
	end

end

def triangle_divisors
	divisors = 2
	count = 1
	total = 0
	while divisors < 500
		total += count
		divisors = number_divisors(total)
		p total
		p divisors
		count+=1 
	end
end

def thousand_dig_fib
	a = 1
	b = 1
	count = 3
	while true do
		c = a+b 
		a = b
		b = c
		p b
		p count
		break if b > 10**999
		count += 1
	end
end

def collatz(max)
	highest = [0,0]
	for starting in 1..max do
		n = starting
		count = 1
		while n != 1 do
			n%2 == 0 ? n = n/2 : n = 3*n + 1
			count +=1
		end
		highest = [starting,count] if count > highest[1]
	end
	return highest
end

def latticepaths(x,y)
	paths = [[0,0]]
	moves = 0
	while moves < (x + y) do
		newarray = []
		paths.each do |path|
			newarray << [path[0]+1,path[1]] if path[0] < x
			newarray << [path[0],path[1]+1] if path[1] < y
		end
		paths = newarray
		moves += 1
	end
	return paths.length
end

def latticepaths2(x,y)
	destines = {[0,0]=>1}
	#use arrays as the keys. set of coordinates is the keys, score is the other.
	moves = 0
	while moves < (x + y) do
		new_destines = {}
		destines.each do |key,value|
			if key[0]< x
				newcoor = [key[0]+1,key[1]]
				new_destines[newcoor] ? new_destines[newcoor] += value : new_destines[newcoor] = value
			end
			if key[1] < y
				newcoor = [key[0],key[1]+1]
				new_destines[newcoor] ? new_destines[newcoor] += value : new_destines[newcoor] = value
			end
		end
		moves += 1
		destines = new_destines
	end
	return destines[[x,y]]
end

def digitsum(x)
	x = x.to_s
	total = 0
	for i in 0..x.length-1 do
		total+=x[i].to_i
	end
	return total
end



def ones_places(x)
	return 0 if x==0 
	return 3 if x>=1 and x<=2
	return 5 if x==3
	return 4 if x>=4 and x<=5
	return 3 if x==6
	return 5 if x>=7 and x<=8
	return 4 if x==9
end

def teens(x)
	return 3 if x==10
	return 6 if x>=11 and x<=12
	return 8 if x>=13 and x<=14
	return 7 if x>=15 and x<=16
	return 9 if x==17
	return 8 if x>=18 and x<=19
end

def tens_places(x)
	return ones_places(x) if x < 10	
	return teens(x) if x < 20
	return 6 + ones_places(x-20) if x >=20 and x<30
	return 6 + ones_places(x-30) if x >=30 and x<40
	return 5 + ones_places(x-40) if x >=40 and x<50
	return 5 + ones_places(x-50) if x >=50 and x<60
	return 5 + ones_places(x-60) if x >=60 and x<70
	return 7 + ones_places(x-70) if x >=70 and x<80
	return 6 + ones_places(x-80) if x >=80 and x<90
	return 6 + ones_places(x-90) if x >=90 and x<100
end

def hundreds(x)
	factor = x/100
	diff = x-factor * 100
	diff == 0 ? value = ones_places(factor) + 7 : value = ones_places(factor) + 10 + tens_places(diff)
	return value
end

def let_count(x)
	return(tens_places(x)) if x >= 1 and x < 100
	return(hundreds(x)) if x >= 100 and x < 1000
	return 11 if x == 1000
end

def euler19
for i in 1..1000
	p "#{i}: #{let_count(i)}"
	sum+= let_count(i)
end
end

def sum_divisors(x)
	#dumb brute force way to find proper divisors, revise for good math trick if found
	sum = 0
	for i in 1..x**0.5
		#p "#{i} + #{x/i}" if x%i ==0
		sum+=i + x/i if x%i == 0
	end
	sum -= x**0.5 if ((x**0.5).to_i)**2 == x
	return sum - x
end

def amicable(max)
	sum = 0
	for i in 3..max do
	 sum+= i  if sum_divisors(sum_divisors(i)) == i and i != sum_divisors(i)
	 p "#{i} + #{sum_divisors(i)}"if sum_divisors(sum_divisors(i)) == i and i != sum_divisors(i)
	end
	return sum
end


def month_days(month,year)
	case month
	when "JAN"
		return [31,"FEB"]
	when "FEB"
		return [29,"MAR"] if year%4==0 and year%100 > 0
		return [29,"MAR"] if year%400 == 0
		return [28,"MAR"] if year%100 == 0 and year%400 > 0
		return [28,"MAR"] if year%4 > 0
	when "MAR"
		return [31,"APR"]
	when "APR"
		return [30,"MAY"]
	when "MAY"
		return [31, "JUN"]
	when "JUN"
		return [30, "JUL"]
	when "JUL"
		return [31, "AUG"]
	when "AUG"
		return [31, "SEP"]
	when "SEP"
		return [30, "OCT"]
	when "OCT"
		return [31, "NOV"]
	when "NOV"
		return [30, "DEC"]
	when "DEC"
		return [31, "JAN"]
	end
end

def day_to_number(day)
	case day
	when "SUN"
		return 0
	when "MON"
		return 1
	when "TUE"
		return 2
	when "WED"
		return 3
	when "THU"
		return 4
	when "FRI"
		return 5
	when "SAT"
		return 6
	end
end

def number_to_day(num)
	case num
	when 0
		return "SUN"
	when 1 
		return "MON"
	when 2
		return "TUE"
	when 3
		return "WEN"
	when 4
		return "THU"
	when 5
		return "FRI"
	when 6
		return "SAT"
	end
end

def first_of_month(start,finish)
	hits = 0
	start["M"] ? month = start["M"] : month = "JAN"
	start["D"] ? day = start["D"] : day = 1
	day_week = day_to_number(start["day_week"])
	year = start["Y"]
	days_in_month = month_days(month,year)[0]
	next_month = month_days(month,year)[1]
	until [month,day,year] == finish
		hits+= 1 if day_week%7 == 0 and day == 1
		day+=1
		day_week+=1
		if day > days_in_month
			month = next_month
			next_month = month_days(month,year)[1]
			days_in_month = month_days(month,year)[0]
			day = 1
		end
		year += 1 if month == "JAN" and day == 1
		p "#{number_to_day(day_week%7)} #{month} #{day} #{year}"
	end

	return hits
end

def factorial(x)
	total = 1
	for i in 1..x
		total*=i
	end
	return total
end

def load_names(path)
	file = File.read(path) 
	a = file.split(",") 
	a.map! {|each| each.gsub("\"","") }
	p a
	return a
end

def alphascore(letter)
	uppers = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
	return uppers.index(letter) + 1
end

def namescore(string)
	total = 0
	for i in 0..string.length-1
		total+=alphascore(string[i])
	end
	return total
end

def abundant_numbers(limit)
	a = []
	for i in 2..limit
		a << i if sum_divisors(i) > i
	end
	return a		
end

def all_numbers(limit)
	(0..limit).to_a
end

def find_nonabundants(limit)
	all =  all_numbers(limit)
	abundant = abundant_numbers(limit)
	count_outer = 0
	active_number = abundant[count_outer]
	

	until active_number > limit / 2
		count_inner = count_outer 
		second_number = active_number
		until second_number + active_number > limit or count_inner>abundant.length - 1
			second_number = abundant[count_inner]
			all[active_number + second_number] = nil
			count_inner+=1
		end
		count_outer += 1
		active_number = abundant[count_outer]
		p active_number
	end
	return all.compact
end

def lex_perms(array)
	#enter as string of numbers
	count = 0
end

def sortdown(array,count)
	array.sort!
	result = []
	for i in 0..array.length-1
		save = array[i]
		newarray = array
		newarray.delete(save)
		p newarray
		p (newarray.length > 1)
		sortdown(newarray,count).each {|x| result << save + x} if newarray.length > 1
		result << save + newarray[0] if newarray.length == 1
		count +=1
	end
	p "result"
	p result
	return result
end

def sortdown_2(array)
	return array if array.length == 1
	array.sort!
	permutes = []
	for i in 0..(array.length - 1)
		save = array[i]
		ends = sortdown_2(array-[save])
		ends.each {|x| permutes << save + x}
	end
	#it's not going in again on recursion
	return permutes
end

def find_recursion(string)
	longest = 0
	segment = ""
	for i in 0..string.length/2
		for j in i..string.length/2-i
			next_start = j+1
			next_end = 2*j-i+1
			if string[next_start..next_end] == string[i..j] 
				segment = string[i..j]
				longest = j-i 
				return [longest,segment]
			end
		end
	end
	return [longest,segment]
end

def find_recursive_fracts(max)
	longest = 0
	number = 0
	segement = ""
	numerator = 10**2000
	for d in 1..1000
		info = find_recursion((numerator/d).to_s)
		if info[0] > longest
			longest = info[0]
			p "new longest! #{info[0]} #{info[1]} #{d} #{numerator/d}"
			number = d
			segment = info[1]
		end
	end
	return [number, segment]
end



def test_coefficients(range)
 primes = full_sieveupto(10**7)
 highest_streak = [0,0,0]
 for a in -1*range .. range
 	for b in -1*range .. range
 		streak_alive = true
 		count = 0
 		while streak_alive do
 			streak_alive = false unless primes[count**2 + count*a + b]
 			count+=1
 		end
 		p count
 		highest_streak = [a,b,count-1] if count > highest_streak[2]
 	end
 end
 return highest_streak
end

def create_square(x)
	big_array = []
	small_array = []
	x.times {small_array << nil}
	x.times {big_array << small_array.dup}
	return big_array
end

def print_array_grid(array)
	#flawed! do not use!
	array.each do |row|
		printed_row = row.inject{|result, line| result.to_s + line.to_s + " x " }
		p printed_row
	end
end

def spiral_square(array)
	#begin at center (array must be odd)
	#something weird is happening with the arrays
	count = 1
	x = array.length / 2 
	y = array[x].length / 2 
	directions = ["r","d","l","u"]
	direction = "u"
	direction_counter = 3
	until count > array.length**2 
		p "#{x},#{y}, #{count}"	
		array[y][x] = count
		case direction
			when "r"
				direction_counter += 1 if x == array.length-1 or array[y+1][x] == nil
			when "d"
				direction_counter += 1 if y == array.length-1 or array[y][x-1] == nil
			when "l"
				direction_counter += 1 if x == 0 or array[y-1][x] == nil
			when "u"
				direction_counter += 1 if y == 0 or array[y][x+1] == nil
			end
			direction_counter = 0 if direction_counter == directions.length
			direction = directions[direction_counter]
		x += 1 if direction == "r"
		y += 1 if direction == "d"
		x -= 1 if direction == "l"
		y -= 1 if direction == "u"
		count += 1
	end
	return array
end

def sum_diags(square)
	sum_total = 0 
	for i in 0..square.length-1
		sum_total += square[i][i]
		p square[i][i]
		sum_total += square[square.length - 1 - i][i]
		#p square[square.length-1-i][i]
	end
	sum_total -= 1
	return sum_total
end

def brute_force_prob_29(x)
	powers = {}
	for a in 2..x
		for b in 2..x
			power = a**b
			powers[power.to_s] = 1
		end
	end
	return powers.length
end

def dumb_brute_force_prob_30(x)
	sums = []
	for i in 10..x
		sum = 0
		number = i.to_s
		number.each_char {|x| sum+= x.to_i**5}
		p "#{i} #{sum}"
		sums << i if sum == i
	end
	p sums
	return sum(sums)
end

p dumb_brute_force_prob_30(1000000)

#test = create_square(1001)
#result = spiral_square(test)
#p result
#p sum_diags(result)
#print_array_grid(result)
#print_array_grid(create_square(5))



#p find_recursive_fracts(1000)

#p find_recursion("abcdeccdeccdeccdeccdeccdeccdec")
#p find_recursion("cdeccdeccdec")
#p find_recursion("cdecccccccccccc")
#p sortdown_2(["0","1","2","3","4","5","6","7","8","9"])[10**6]

#p namescore("COLIN")
#a = load_names("names_for_scoring.txt")
#a.sort!
#total = 0
#for i in 0..a.length-1
#	total+=namescore(a[i]) * (i+1)
#	p "#{a[i]} #{namescore(a[i])} #{i+1} #{total}"
#end
#p total


#p digitsum (factorial(100))
#p first_of_month({"M" => "JAN", "D" => 1, "day_week" => "TUE", "Y" => 1901},["DEC",31,2000])

#p amicable(10000)
#p sum_divisors(284)
#p digitsum(2**1000)
#p latticepaths(20,20)
#p latticepaths2(20,20)
#p collatz(1000000)

#thousand_dig_fib

#a = loadfile("largesumgrid.txt")
#a.map! { |e| e[0]  }
#p a
#p sum(a)


#p breaktoprime(10**30)
#p number_divisors(2**14*3**56)
#triangle_divisors




#a = loadfile("2020grid.txt")
#p a
#highest_in_grid(a)


#p sieveupto(2000000)
#p sum sieveupto(2000000)
#p primesupto_v3(50000)

#p "#{a} + #{b} + #{c} = #{a + b + c} "
			#p "Match found! product is #{a*b*c}" if a**2 + b**2 == c**2
			#p "a^2 = #{a**2} b^2 =#{b**2} c^2 =#{c**2}"
			#p "a^2 + b^2 = #{a**2 + b**2}"
#pythag9
#iterate_tri(loadtriangle18)
#biggestproduct("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450")
#primesupto(10000)
#primesieve(10000)
#nthprime(1000)

#sumsquarediff(100)
#evenlydivisible


#breaktoprime(1342124124)
#p primesupto(356)
#p findfactors(600851475143)