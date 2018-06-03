require_relative 'blackjack'

RSpec.describe Blackjack do

    SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
    RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

    before do
        @blackjack = Blackjack.new(SUITS, RANKS)
    end

    it 'responds to player_hand' do
        expect(@blackjack).to respond_to(:player_hand)
    end

    it 'responds to dealer_hand' do
        expect(@blackjack).to respond_to(:dealer_hand)
    end
    
    it 'responds to game_in_progress' do
        expect(@blackjack).to respond_to(:game_in_progress)
    end

    it 'responds to deck' do
        expect(@blackjack).to respond_to(:deck)
    end

    it 'responds to current_player' do
        expect(@blackjack).to respond_to(:current_player)
    end
    
    describe '#deal' do

        before do
            @blackjack.deal
            @player_cards = @blackjack.player_hand.dealt_cards
            @dealer_cards = @blackjack.dealer_hand.dealt_cards
        end
        
        it 'responds to deal' do
            expect(@blackjack).to respond_to(:deal)
        end

        it 'should return 2 cards for the dealer and player after dealing' do
            expect(@player_cards.count).to eq(2)
            expect(@dealer_cards.count).to eq(2)
        end

        it 'should not display the first card of the dealer, should display last' do
            expect(@dealer_cards.first.show).to eq(false)
            expect(@dealer_cards.last.show).to eq(true)
        end

        it 'should end the turn of player if a blackjack is dealt' do
            card1 = Card.new("Hearts", "3")
            card2 = Card.new("Hearts","Ace")
            card3 = Card.new("Hearts", "2")
            card4 = Card.new("Hearts", "Jack")

            @blackjack = Blackjack.new SUITS, RANKS
            new_deck = [card1, card2, card3, card4]
            @blackjack.deck.replace_with(new_deck)
            @blackjack.deal

            expect(@blackjack.current_player).to eq("Dealer")

        end

    end

    describe '#hit' do
        before do
            @blackjack = Blackjack.new SUITS, RANKS
            @blackjack.deal
            @player_cards = @blackjack.player_hand.dealt_cards
            @dealer_cards = @blackjack.dealer_hand.dealt_cards
        end

        it 'responds to hit' do
            expect(@blackjack).to respond_to(:hit)
        end

        it 'should only hit if game is in progress' do
            expect(@blackjack.game_in_progress).to eq(true)
        end

        it 'should return 3 cards for the player and 2 for the dealer' do
            @blackjack.hit
            expect(@player_cards.count).to eq(3)
            expect(@dealer_cards.count).to eq(2)
        end

        it 'player should bust if dealt more than 21 from cards' do
            card1 = Card.new("Hearts", "3")
            card2 = Card.new("Hearts","King")
            card3 = Card.new("Hearts", "2")
            card4 = Card.new("Hearts", "Jack")
            card5 = Card.new("Hearts", "10")
            card6 = Card.new("Hearts", "10")

            @blackjack = Blackjack.new SUITS, RANKS
            new_deck = [card1, card2, card3, card4, card5, card6]
            @blackjack.deck.replace_with(new_deck)
            @blackjack.deal
            @blackjack.hit

            expect(@blackjack.game_in_progress).to eq(false)
            expect(@blackjack.result).to eq("Player busted!")
        end

        it 'dealer should bust if dealt more than 21 from cards' do
            card1 = Card.new("Hearts", "3")
            card2 = Card.new("Hearts","King")
            card3 = Card.new("Hearts", "10")
            card4 = Card.new("Hearts", "Ace")
            card5 = Card.new("Hearts", "10")
            card6 = Card.new("Hearts", "10")

            @blackjack = Blackjack.new SUITS, RANKS
            new_deck = [card1, card2, card3, card4, card5, card6]
            @blackjack.deck.replace_with(new_deck)
            @blackjack.deal
            @blackjack.hit

            expect(@blackjack.game_in_progress).to eq(false)
            expect(@blackjack.result).to eq("Dealer busted!")
        end

    end

    describe '#stand' do
        
        before do
            @blackjack = Blackjack.new SUITS, RANKS
            card1 = Card.new("Hearts", "3")
            card2 = Card.new("Hearts","4")
            card3 = Card.new("Hearts", "2")
            card4 = Card.new("Hearts", "10")
            card5 = Card.new("Hearts", "10")
            card6 = Card.new("Hearts", "10")
            new_deck = [card1, card2, card3, card4, card5, card6]
            @blackjack.deck.replace_with(new_deck)
            @blackjack.deal
        end

        it 'responds to stand' do
            expect(@blackjack).to respond_to(:stand)
        end

        it 'should switch current_player from player to dealer, then back to player' do
            @blackjack.stand
            expect(@blackjack.current_player).to eq("Player")
        end

        it 'should have dealer hit if its score < 17' do
            expect(@blackjack.dealer_hand.get_value).to eq(12)
            @blackjack.stand
            expect(@blackjack.dealer_hand.get_value).to eq(16)
        end

        it 'should show all dealers cards' do
            @blackjack.stand
            expect(@blackjack.dealer_hand.dealt_cards.first.show).to eq(true)
        end

    end

    describe '#show_hands' do
        before do
            @blackjack = Blackjack.new SUITS, RANKS
            @blackjack.deal
        end

        it 'responds to show_hands' do
            expect(@blackjack).to respond_to(:show_hands)
        end

        it 'should return the hands of the gamer' do
            expect(@blackjack.show_hands).to match(/Player's hand:/)
            expect(@blackjack.show_hands).to match(/Dealer's hand:/)
        end

    end

    describe '#set_result' do
        it 'responds to set_result' do
            expect(@blackjack).to respond_to(:set_result)
        end
    end

end