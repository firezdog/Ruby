require_relative 'blackjack'

SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

game = Blackjack.new SUITS, RANKS
game.deal

puts game

while game.player_hand.get_value <= 21 do
    puts
    puts "Want to hit (1) or stand (2)?"
    res = gets.chomp
    if res.to_i == 1
        game.hit
        puts game
    elsif res.to_i == 2
        game.stand
        puts game
    end
end