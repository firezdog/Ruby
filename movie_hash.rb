@movies = Hash.new("Not found")

def add
    puts "What is the movie name?"
    name = gets.chomp
    puts "What is the movie rating (from 0-4)?"
    rating = gets.chomp.to_i
    if 0 <= rating && rating <= 4
        @movies.store(name,rating)
    else
        puts "Invalid rating."
    end
end

def update
    puts "Enter the name of the movie you wish to update."
    query = gets.chomp
    selection = @movies.select { |k,v| k == query }
    if selection == {}
        puts "================================="
        puts "Movie not found"
    else
        for k,v in selection
            puts "================================="
            puts "Movie: #{k}"
            puts "Rating: #{v}"
        end
        puts "Enter a new movie name:"
        newName = gets.chomp
        puts "Enter a new movie rating (0-4)"
        newRating = gets.chomp.to_i
        if 0 <= newRating && newRating <= 4
            @movies.delete(query)
            @movies.store(newName,newRating)
        else
            puts "Rating must be a number from 0 to 4."
        end
    end
end

def display
    puts "Lookup a movie to display."
    query = gets.chomp
    selection = @movies.select { |k,v| k == query }
    if selection == {}
        puts "================================="
        puts "Movie not found"
    else
        for k,v in selection
            puts "================================="
            puts "Movie: #{k}"
            puts "Rating: #{v}"
        end
    end
end

def delete
    puts "Lookup a movie to delete."
    query = gets.chomp
    selection = @movies.select { |k,v| k == query }
    if selection == {}
        puts "================================="
        puts "Movie not found"
    else
        puts "================================="
        for k,v in selection
            puts "Movie: #{k}"
            puts "Rating: #{v}"
        end
        puts "Are you sure you want to delete this movie? (enter 'N' to cancel)?"
        unless gets.chomp.downcase == "n"
            @movies.delete(query)
            puts "Movie deleted."
        else
            puts "Deletion canceled."
        end
    end
end

commands = {
    add: method(:add),
    update: method(:update),
    display: method(:display),
    delete: method(:delete),
}

while true
    begin
        puts "================================="
        puts "What would you like to do?"
        puts "-- Type 'add' to add a movie"
        puts "-- Type 'update' to update a movie"
        puts "-- Type 'display' to display a movie"
        puts "-- Type 'delete' to delete a movie"
        user_input = gets.chomp
        puts "================================="
        commands[user_input.to_sym].call
    rescue
        puts "==============="
        puts "Invalid command."
    end
end