require_relative 'hand'
require_relative 'card'
require_relative 'deck'

class Blackjack 

    attr_reader :player_hand, :dealer_hand, :deck, :game_in_progress, :result
    attr_accessor :current_player 

    def initialize suits, ranks
        @player_hand = Hand.new
        @dealer_hand = Hand.new
        @result = ""
        @current_player = ""
        @game_in_progress = false
        @deck = Deck.new(suits,ranks)
        @deck.shuffle
    end

    def deal
        first_run = false
        2.times do 
            @player_hand.add_card @deck.deal_card
            @dealer_hand.add_card(@deck.deal_card, first_run ? true : false)
            first_run = true unless first_run
        end

        @game_in_progress = true
        @current_player = @player_hand.get_value == 21 ? "Dealer" : "Player"

    end

    def hit
        if game_in_progress
           @current_player == "Player" ?
                add_new_card(@player_hand) :
                add_new_card(@dealer_hand)
        end
    end

    def add_new_card hand
        hand.add_card @deck.deal_card
        if hand.get_value > 21
            @result = "#{@current_player} busted!" 
            @game_in_progress = false;
        end
    end

    def stand
        if @game_in_progress
            @current_player = @current_player == "Player" ? "Dealer" : "Player"
            if @current_player == "Dealer"
                @dealer_hand.dealt_cards.first.reveal
                if @dealer_hand.get_value < 17
                    add_new_card @dealer_hand 
                end
                stand
            end
        end
    end

    def show_hands
        "Player's hand: #{@player_hand}\nDealer's hand: #{@dealer_hand}\n=============================================================="
    end

    def set_result
    end

    def to_s
        puts
        show_hands
    end

end