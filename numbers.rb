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



p findmults(10,5,3)
p sum([1,2,3,4])
array = findmults(1000,5,3)
p array
p sum(array)