$primes = [2];

def isPrime num
  if num==1
    return false;
  end
  i = 2;
  while i<=num/2
    if num%i == 0
      return false;
    end
    i+=1;
  end
  return true;
end

i=3;
while i<50000
  if isPrime(i)
    $primes.push(i);
  end
  i+=2;
end

$prime = 2;
$numbers = 1;

for i in 0...$primes.length
  sum = 0;
  count = 0;
  for j in i...$primes.length
      sum += $primes[j];
      count += 1;
      if sum > 1000000
        break;
      end  
      if count > $numbers
        if isPrime(sum)
          $numbers = count;
          $prime = sum;
        end
      end
  end
end

puts "#{$prime}";