def alphabetize (arr, rev=false)
  arr.sort!
  if rev
    arr.reverse!
  else
    return arr
  end
end

numbers = [7,6,5,4,3,2,1]
numbers = alphabetize(numbers)
puts numbers