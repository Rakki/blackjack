class Game

  require './cards.rb'

  def initialize
    puts 'Hello, Player!'
    puts 'Now we are start our mini-game. You are ready?[y\n]'
    answer = gets.chomp.downcase
    if answer == 'y'
      puts 'Game to start!'
      @playerDeck = []
      @pcDeck = []
      userTakeCard
    elsif answer == 'n'
      puts "Ok"
    else
      puts "You answer incorrect. We can't let you in the game!"
    end
  end


  def userTakeCard
  	@playerPoint = 0
    loop do
      if @playerPoint < 21
        puts 'More card?[y\n]'
        @more = gets.chomp.downcase
      	if @more == 'y'
          currentCard = $deckForGame.shift
          @playerDeck << currentCard
          @playerPoint += $cardsDeck[currentCard]
          puts "Now you get " + currentCard.to_s
          puts 'You card deck: ' + @playerDeck.to_s + ' It is ' + @playerPoint.to_s + ' point'
        elsif @more == 'n'
          pcStage
          if @pcPoint < 21 && @playerPoint < 21
            if @playerPoint > @pcPoint
              puts 'PC Point =  ' + @pcPoint.to_s + '. So you win!'
            elsif @playerPoint == @pcPoint
              puts 'Score equal. Friendship won!'
            else
              puts 'PC Point =  ' + @pcPoint.to_s + '. So you loose!'
            end
          elsif @pcPoint == 21 && @playerPoint < 21
            puts 'PC Point = 21. So you loose! '
          elsif @pcPoint > 21 && @playerPoint < 21
            puts 'PC Point =  ' + @pcPoint.to_s + '. So you win!'
          end
          break
        else
          puts "Please type Y or N!"   
        end
      elsif @playerPoint == 21
      	puts "Congratulate! You win! You score 21!"
        break
      elsif @playerPoint > 21
        puts 'Oops, you loose! :('
        break
      else
        puts "Please type Y or N!"
      end
    end
  end

  def pcStage
    @pcPoint = 0
    begin
      currentCard = $deckForGame.shift
      @pcDeck << currentCard
      @pcPoint += $cardsDeck[currentCard]   
    end while @pcPoint < 17
    puts @pcDeck
  end
end

game = Game.new