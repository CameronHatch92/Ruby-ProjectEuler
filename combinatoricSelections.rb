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

puts "#{partialFact 3, 5}"