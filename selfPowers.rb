$answer = 0;

def tenDigits num
  count = 0;
  temp = num;
  newNum = 0;
  while (count<10 and temp>0)
    newNum += (temp%10)*(10**count);
    temp = (temp/10).floor;
    count+=1;
  end
  return newNum;

end

for i in 1..1000
  $answer += (tenDigits (i**i));
end

puts "#{tenDigits $answer}";
