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
			p array
			total = total / count
		else 
			count+=1
		end
	end
	return array
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

biggestproduct("7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450")
#primesupto(10000)
#primesieve(10000)
#nthprime(1000)

#sumsquarediff(100)
#evenlydivisible


#breaktoprime(1342124124)
#p primesupto(356)
#p findfactors(600851475143)