def factorial num
  if num===1 or num === 0
    return 1;
  end
  product = 1;
  for i in 2..num
    product *= i;
  end
  return product;
end

def partialFact first, last
  product = first;
  for i in (first+1)..last
    product *= i;
  end
  return product;
end

count = 0;
for i in 23..100
  for j in 1..i
    min = [i-j,j].min;
    max = [i-j,j].max;
    combin = (partialFact(max+1,i))/factorial(min);
    if combin>1000000
      count+=1;
    end
  end
end

puts "#{count}"