require_relative 'card'

suit = 'Hearts'
rank = '8'

card = Card.new suit, rank

puts card
card.show = false
puts card