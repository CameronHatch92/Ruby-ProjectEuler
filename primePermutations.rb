def isPrime num
  i = 2;
  while i<=num/2
    if num%i===0
      return false;
    end
    i+=1;
  end
  return true;
end

def isPermutation num1, num2
  str1 = num1.to_s;
  str2 = num2.to_s;
  str1 = str1.chars.sort.join;
  str2 = str2.chars.sort.join;
  if str1 === str2
    return true;
  end
  return false;
end

possible = 1001;
while possible<9999
  if isPrime possible
    maxDiff = ((9999-possible)/2).ceil;
    currentDiff = 2;
    while currentDiff < maxDiff
      num1 = possible + currentDiff;
      if (isPrime num1 and isPermutation possible, num1)
        num2 = possible + (currentDiff*2);
        if (isPrime num2 and isPermutation possible, num2)
          puts "#{possible}, #{num1}, #{num2}"
        end
      end
      currentDiff += 2;
    end
  end
  possible += 2;
end