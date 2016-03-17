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


breaktoprime(600851475143)
#p primesupto(356)
#p findfactors(600851475143)