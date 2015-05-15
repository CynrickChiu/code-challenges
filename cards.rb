class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end
end

class Deck
  def initialize
    @cards = []
    suits = %w{Spades Hearts Clubs Diamonds}
    ranks = %w{Ace 2 3 4 5 6 7 8 9 10 Jack Queen King}

    suits.each do |suit|
      ranks.each_index do |i|
        @cards << Card.new(ranks[i], suit)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal
    # @cards.shift
    top_card = @cards.shift
    top_card.output_card
  end

  def output_deck
    @cards.each { |card| card.output_card }
  end

  def deck_size
    puts @cards.size
  end
end

deck = Deck.new
deck.shuffle
deck.deal
deck.deck_size