
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

largestPrimeFactor(600851475143);

