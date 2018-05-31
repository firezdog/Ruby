class Hand

    attr_accessor :dealt_cards

    VALUES = {
        '2': 2,
        '3': 3,
        '4': 4,
        '5': 5,
        '6': 6,
        '7': 7,
        '8': 8,
        '9': 9,
        '10': 10,
        'Jack': 10,
        'Queen': 10,
        'King': 10,
        'Ace': [1,11]

    }

    def initialize
        @dealt_cards = []
    end

    def add_card card
        @dealt_cards << card
    end

    def get_value
        card_ranks = []
        result = 0
        @dealt_cards.each do |card|
            card_ranks << card.rank
        end
        card_ranks.each do |rank|
            rank = rank.to_sym
            result += VALUES[rank] unless rank == :Ace
            result += (result + 11 > 21) ? VALUES[:Ace][0] : VALUES[:Ace][1] if rank == :Ace
        end
        result
    end

end