
function problem1() {
var sum = 0;
for (i = 0; i < 1000 ; i ++) {
	if (i%3 === 0 || i%5 === 0) {
		sum+= i;
	}
}
return sum;
}

function problem2() {
	var sum = 0;
	var most_recent = 1;
	var second_most_recent = 1;
	var temp_sum = 2;
	while (most_recent < 4000000) {
		temp_sum = second_most_recent + most_recent;
		if (temp_sum%2===0) {
			sum += temp_sum;
		}
		second_most_recent = most_recent;
		most_recent = temp_sum;
	}
	console.log(sum);
}

function notPrime(max) {
	var not_primes = new Array(max);
	not_primes[0] = true;
	not_primes[1] = true;
	for (i = 0; i < max; i++) {
		if (not_primes[i]) {
			continue;
		}
		else {
			for (j=i*2; j < max; j+= i) {
				not_primes[j] = true;
			}
		}

	}
	return not_primes;
}

function listPrimes(max) {
	not_primes = notPrime(max);
	for (i = 0; i < not_primes.length; i++) {
		if (not_primes[i]) {
			continue;
		} else {
			console.log(i);
		}
	} 
}

function largestPrimeFactor(n) {
	var working_total = n;
	var prime_factors = [];
	var working_prime = 2;
	while (working_total > working_prime) {
		if (working_total % working_prime !== 0) {
			working_prime++;
			continue;
		}
		else  {
			console.log("Dividing " + working_total + " by " + working_prime + " to get " + working_total/working_prime)
			working_total /= working_prime;
			prime_factors.push(working_prime);
			console.log("List of prime factors is now " + prime_factors);
		}
	}
	console.log("Largest prime is " + working_prime)
	return working_prime;
}

function problem3 () {
	return largestPrimeFactor(600851475143);
}

function stringRay(string) {
	var array = [];
	for (i = 0 ; i < string.length; i++) {
		array.push(string[i]);
	}   
	return array;
}

function isPalindrome(number) {
	var n_string = number.toString();
	var n_array = stringRay(n_string);
	var rev_array = n_array.slice().reverse();
	var palindrome = true;
	for (i = 0; i <= n_array.length/2 ; i++) {
		if (rev_array[i] !== n_array[i]) {
			palindrome = false;
		}

	}
	return palindrome;
}

function largestPalindromeProduct(max) {
	var largest = 0;
	for (j = 0; j < max; j++) {
		for (k = 0; k < max; k++) {
			var big = max - j;
			var small = max - k;
			if ((big * small) < largest) {
				
				break;
			} 
			else if (isPalindrome(big * small)) {
				largest = big * small;
			}
		}
	}
	return largest;
}

function problem4() {
   return largestPalindromeProduct(9999);
}

/*
problem 5 solved logically. 
If you multiply out the highest powers of each prime under a number, then you are sure to be divisible by everything else.
And if you aren't multiplying by those highest powers, then you're not. So it's necessary and sufficient.
It can be done programatically (and should be for higher numbers) but for now we can just use what we know:
2 (16)
3 (9)
5 
7 
11
13
17
19
*/


function problem5() {
	return 16 * 9 * 5 * 7 * 11 * 13 * 17 * 19;
}


function sumSquare(max) {
	var sum = 0;
	for (i = 1; i <= max; i++) {
		sum+= i * i;
	}
	return sum;
}

function squareSum(max) {
	var sum = 0; 
	for (i = 1; i <= max; i++) {
		sum+= i;
	}
	return sum * sum;
}

function problem6() {
	return squareSum(100) - sumSquare(100);
}

function nthPrime(n) {
	not_primes = notPrime(n*20);
	var num_primes = 0;
	for (i = 0; i<not_primes.length - 1; i++) {
		if (not_primes[i]) {
			continue
		}
		else {
			num_primes++;
			if (num_primes === n) {
				return i;
			} 
		}
	}
}

function problem7(){
	return nthPrime(10001);
}

console.log(problem7());
