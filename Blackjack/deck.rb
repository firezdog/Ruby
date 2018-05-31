require_relative 'card'

class Deck

    attr_accessor :deck, :suits, :ranks

    def initialize suits, ranks
        @deck = []
        @suits = suits
        @ranks = ranks
        create_deck
    end

    def shuffle
        @deck.shuffle!
    end

    def deal_card
        @deck.pop
    end

    def replace_with(new_deck)
        @suits = []
        @ranks = []

        @deck = new_deck
        new_deck.each do |card|
            add_suits_and_ranks(card)
        end
        self
    end

    def add_suits_and_ranks card
        suit = card.suit
        rank = card.rank
        @suits.push(suit) unless @suits.include?(suit)
        @ranks.push(rank) unless @ranks.include?(rank)
    end

    def create_deck
        suits.each do |suit|
            ranks.each do |rank|
                @deck.push(Card.new(suit,rank))
            end
        end
    end

end