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

nums = Array.new(100000){
  |e| e = 2*e + 1;
};
$primes = nums.select{
  |e| isPrime(e)
};
$primes.unshift(2);

def primeFactors num
  count = 0;
  temp = num;
  i=0;
  while temp>1
    prime = $primes[i];
    if temp%prime==0
      count+=1;
      if count >= 5
        return 5;
      end
      while temp%prime==0 
        temp = temp/prime;  
      end
    end 
    i+=1;
  end
  return count;
end


def answer 
  j=210;
  while true
    if (primeFactors j)==4
      if (primeFactors j+1)== 4
        if (primeFactors j+2) == 4
          if (primeFactors j+3) == 4
            puts "#{j}";
            return j;
          end
        end
      end
    end
    j+=1;
  end
end  

puts "#{answer}"


