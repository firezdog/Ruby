puts "Enter any string:"
user_input = gets.chomp.downcase.split(" ")

histogram = Hash.new(0)

user_input.each do |word| histogram[word] += 1 end
histogram.sort_by { |a,b| b }
histogram = histogram.reverse_each

histogram.each do |word, frequency| puts "#{word}: #{frequency}" end