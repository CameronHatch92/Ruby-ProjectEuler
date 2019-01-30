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

def findDigits num
  str = num.to_s;
  chars = str.split('');
  obj = Hash.new;
  for i in 0...chars.length
    if obj.has_key?(chars[i])
      obj[chars[i]].push(i);  
    else
      obj[chars[i]]=[i]; 
    end
  end
  return obj;
end

def findSubsets arr
  if arr.length === 1
    return [arr];
  end
  if arr.length === 2
    return [arr, [arr[0]], [arr[1]]];
  end
  if arr.length === 3
    return [arr, [arr[0], arr[1]], [arr[0], arr[2]], [arr[1], arr[2]], [arr[0]], [arr[1]], [arr[2]]];
  end
  if arr.length === 4
    return [arr, [arr[0]],[arr[1]],[arr[2]],[arr[3]],[arr[0], arr[1], arr[2]],[arr[3], arr[1], arr[2]],[arr[0], arr[3], arr[2]],[arr[0], arr[1], arr[3]],
    [arr[0], arr[1]], [arr[0], arr[2]],[arr[0], arr[3]],[arr[1], arr[2]],[arr[1], arr[3]],[arr[2], arr[3]]
  ]
  end
  return [arr];
end

def primeCount digit, arr
  str = digit.to_s.split('');
  primeCount = 0;
  for i in 0..9
    iStr = i.to_s;
    for j in 0...arr.length
      if (not i===0 or not arr[j]===0)
        str[arr[j]]=iStr;
      end
    end
    if isPrime(str.join('').to_i)
      primeCount += 1;
      if (primeCount + 10-i)<8
        return primeCount;
      end
    end
  end
  return primeCount;

end

def getPrime
  prime = 101;
  primeCount = 1;
  while prime<111109
    if isPrime(prime)
      obj = findDigits(prime)
      newObj = obj.transform_values{|v| findSubsets(v)};
      digits = newObj.keys;
      for i in 0...digits.length
        for j in 0...newObj[digits[i]].length
          primeNum = primeCount prime, newObj[digits[i]][j]
          if primeNum >= 8
            puts "#{newObj[digits[i]][j]}"
            return prime
          end
        end
        
      end

    end
    prime +=2;
    primeCount = 0;
  end

end

puts "#{getPrime}"

# puts "#{isPrime 111109}";



