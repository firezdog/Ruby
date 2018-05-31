print "Thtring pleathe: "
user_input = gets.chomp
user_input.downcase!

if user_input.include? "s" 
  user_input.gsub!(/s/, "th")
  puts "Changed input: #{user_input}"
else 
  puts "Nothing to do -- no 's'..."
end