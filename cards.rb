class Cards
  def initialize
    $cardsDeck = {
      '2♡' => 2, '2♢' => 2, '2♧' => 2, '2♤' => 2,
      '3♡' => 3, '3♢' => 3, '3♧' => 3, '3♤' => 3,
      '4♡' => 4, '4♢' => 4, '4♧' => 4, '4♤' => 4,
      '5♡' => 5, '5♢' => 5, '5♧' => 5, '5♤' => 5,
      '6♡' => 6, '6♢' => 6, '6♧' => 6, '6♤' => 6,
      '7♡' => 7, '7♢' => 7, '7♧' => 7, '7♤' => 7,
      '8♡' => 8, '8♢' => 8, '8♧' => 8, '8♤' => 8,
      '9♡' => 9, '9♢' => 9, '9♧' => 9, '9♤' => 9,
      '10♡' => 10, '10♢' => 10, '10♧' => 10, '10♤' => 10,
      'V♡' => 10, 'V♢' => 10, 'V♧' => 10, 'V♤' => 10,
      'D♡' => 10, 'D♢' => 10, 'D♧' => 10, 'D♤' => 10,
      'K♡' => 10, 'K♢' => 10, 'K♧' => 10, 'K♤' => 10,
      'T♡' => 11, 'T♢' => 11, 'T♧' => 11, 'T♤' => 11
    }

    deckForGame = [
      '2♡', '2♢', '2♧', '2♤',
      '3♡', '3♢', '3♧', '3♤',
      '4♡', '4♢', '4♧', '4♤',
      '5♡', '5♢', '5♧', '5♤',
      '6♡', '6♢', '6♧', '6♤',
      '7♡', '7♢', '7♧', '7♤',
      '8♡', '8♢', '8♧', '8♤',
      '9♡', '9♢', '9♧', '9♤',
      '10♡', '10♢', '10♧', '10♤',
      'V♡', 'V♢', 'V♧', 'V♤',
      'D♡', 'D♢', 'D♧', 'D♤',
      'K♡', 'K♢', 'K♧', 'K♤',
      'T♡', 'T♢', 'T♧', 'T♤'
    ]

    $deckForGame = deckForGame.shuffle! 
  end

end

cards = Cards.new