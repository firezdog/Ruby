puts "Enter a string of text."
text = gets.chomp
words = text.split(" ")
puts "Enter a word to redact."
redact = gets.chomp

words.each do |word|
  if word == redact
    print "REDACTED "
  else
	  print word + " "
  end
end