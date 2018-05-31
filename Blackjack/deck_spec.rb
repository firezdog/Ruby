require_relative 'deck'

RSpec.describe Deck do

    SUITS = ["Hearts", "Spades", "Clubs", "Diamonds"]
    RANKS = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

    before do
        @deck = Deck.new SUITS, RANKS
    end

    it 'should respond to suits' do
        expect(@deck).to respond_to(:suits)
    end

    it 'should respond to ranks' do
        expect(@deck).to respond_to(:ranks)
    end

    it 'should respond to deck' do
        expect(@deck).to respond_to(:deck)
    end

    it 'should respond to shuffle' do
        expect(@deck).to respond_to(:shuffle)
    end

    it 'should respond to deal_card' do
        expect(@deck).to respond_to(:deal_card)
    end

    it 'should respond to replace_with' do
        expect(@deck).to respond_to(:replace_with)
    end

    it 'pops off stack when card is dealt' do
        dealt_card = @deck.shuffle.last
        expect(@deck.deal_card).to eq(dealt_card)
    end

    it 'dealt card is not nil' do
        expect(@deck.deal_card).to_not eq(nil)
    end

    it 'gets a new deck from replace_with' do
        deck_of_cards = []
        deck_of_cards.push(Card.new("Hearts","8"), Card.new("Hearts","9"))
        new_deck = @deck.dup
        new_deck.replace_with(deck_of_cards)
        expect(@deck.deck).not_to eq(new_deck.deck)
    end

    it 'should have a deck with 52 cards' do
        expect(@deck.deck.length).to eq(52)
    end

end