require_relative 'card'
require_relative 'hand'

player_hand = Hand.new
dealer_hand = Hand.new

player_hand.add_card(Card.new("Diamonds", "Ace"))
player_hand.add_card(Card.new("Diamonds", "Ace"))
puts "Player's hand: #{player_hand}"

dealer_hand.add_card(Card.new("Diamonds", "8"))
dealer_hand.add_card(Card.new("Diamonds", "Ace"))
puts "Dealer's hand: #{dealer_hand}"
