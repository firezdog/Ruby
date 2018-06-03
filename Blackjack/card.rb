class Card

    attr_accessor :suit, :rank, :show

    SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
    RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

    def initialize suit, rank
        if SUITS.include?(suit) && RANKS.include?(rank)
            @suit = suit
            @rank = rank
            @show = true
        else
            @suit = "UNKNOWN"
            @rank = "UNKNOWN"
        end
    end

    def hide
        @show = false
    end

    def reveal
        @show = true
    end

    def to_s
        return "#{rank} of #{suit}" if show
        "Card is hidden."
    end

end