movies = { 
  Titanic: 3 
}

puts "What would you like to do?"
puts "-- Type 'add' to add a movie"
puts "-- Type 'update' to update a movie"
puts "-- Type 'display' to display a movie"
puts "-- Type 'delete' to delete a movie"
choice = gets.chomp

case choice
  when "add"
  	puts "Enter a movie title."
  	title = gets.chomp
  	puts "Enter a movie rating."
  	rating = gets.chomp
  	if !movies[title.to_sym]
      movies[title.to_sym] = rating.to_i
      puts "Movie title #{title} with rating #{rating} added to movies."
    else
      puts "Movie already exists."
    end
  when "update"
  	puts "Enter a movie title."
  	title = gets.chomp
  	if !movies[title.to_sym]
      puts "Movie not found."
    else
      puts "Enter a new rating for #{title}"
      movies[title.to_sym] = gets.chomp.to_i
      puts "Movie updated"
    end
  when "display"
  	movies.each do |movie, rating|
      puts "#{movie}: #{rating}"
    end
  when "delete"
  	puts "Enter a movie title."
  	title = gets.chomp
  	if !movies[title.to_sym]
      puts "Error -- movie not found."
    else
      movies.delete(title.to_sym)
    end
	else
  	puts "Error!"
end