def tri num
  return num*(num+1)/2;
end

def pent num
  return num*(3*num-1)/2;
end

def hex num
  return num*(2*num-1);
end

triArr = Array.new(100000){
  |e| e = tri(e);
}

pentArr = Array.new(100000){
  |e| e = pent(e);
}

hexArr = Array.new(100000){
  |e| e = hex(e);
}

filterTri = triArr.select{
  |a| a>40755;
};

filterPent = pentArr.select{
  |a| a>40755;
};

filterHex = hexArr.select{
  |a| a>40755;
};

filterTri.each {
  |a|
  if filterHex.include?(a)
    if filterPent.include?(a)
      puts "#{a}";
    end
  end    
}

# triArr.each {
#   |a|
#   if hexArr.include?(a)
#     if pentArr.include?(a)
#       puts "#{a}";
#     end
#   end    
# }
