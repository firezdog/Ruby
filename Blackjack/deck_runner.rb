require_relative 'deck'

SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

deck = Deck.new(SUITS,RANKS)
puts deck
puts "===========CREATED NEW DECK==============="
puts deck.deck
puts "===========SHUFFLED DECK==============="
deck.shuffle
puts deck.deck
puts "===========DEALING CARD NEW DECK==============="
puts deck.deal_card
puts "===========NEW DECK LENGTH==============="
puts deck.deck.length
puts

new_deck = []
new_deck.push(Card.new("Hearts","8"),Card.new("Hearts","9"),Card.new("Hearts","10"))
puts "===========REPLACED DECK==============="
deck.replace_with(new_deck)
puts deck.deck
puts "===========SHUFFLED NEW DECK==============="
puts deck.shuffle
puts "===========DEALT NEW DECK'S LAST CARD==============="
puts deck.deal_card