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

p sumsq
a=*(1..int) 
p a
sqsum = sum(a)**2
p sqsum
p "Square of sum (#{sqsum}) minus sum of squares (#{sumsq}) equals #{sqsum-sumsq}"
end

sumsquarediff(100)
#evenlydivisible


#breaktoprime(1342124124)
#p primesupto(356)
#p findfactors(600851475143)