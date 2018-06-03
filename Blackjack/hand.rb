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
        'Ace': lambda { |total| total + 11 <= 21 ? 11 : 1 }
    }

    def initialize
        @dealt_cards = []
    end

    def add_card card, show = true
        card.hide unless show
        @dealt_cards << card
    end

    def get_value
        card_ranks = @dealt_cards.map{|card| card.rank }
        sum = card_ranks.reduce(0) { |total, rank|
            total += rank == "Ace"? 
                VALUES[rank.to_sym].call(total) :
                VALUES[rank.to_sym]
        }
    end

    def to_s
        message = ""
        score = get_value
        @dealt_cards.each do |card|
            message += card.show ? "#{card.to_s}, " : ""
            score -= card.show ?
                0 : card.rank == "Ace" ?
                    VALUES[:Ace].call(score-11) :
                    VALUES[card.rank.to_sym]
        end
        message += "#{score} points"
    end

end