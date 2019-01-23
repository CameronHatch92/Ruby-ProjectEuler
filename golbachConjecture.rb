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

$squares = Array.new(1000){
  |e| e=e**2;
}

odds = Array.new(10000){
  |e| e = e*2 + 1;
}

$primes = odds.select{
  |e| isPrime(e)
};

$composites = odds.select{
  |e| !isPrime(e) and e>1
};


def golbachException
  for j in 0...$composites.length 
    num = $composites[j];
    golbach = false;
    i=0;
    while $primes[i]<num
      possSq = (num-$primes[i])/2;
      if $squares.include?(possSq)
        golbach = true;
        break;
      end
      i+=1;  
    end
    if not golbach
      return num;
    end 
  end
  return 0;
end

puts "#{golbachException}"
