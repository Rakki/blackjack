class Game

  require './cards.rb'

  def initialize
    # Получаем основную информацию об игроке.
    getPlayername
    getPlayerMoney
    defaultValue
    puts 'Привет, ' + @playerName.to_s + '! Сейчас у тебя есть ' + @playerMoney.to_s + '$. Ты готов сыграть?'
    puts 'Сейчас и далее для подтверждения вам необходимо отвечать "y", для отказа "n".'
    condition
  end

  def condition
    # Соглашение об игре.
    @answer = gets.chomp.downcase
    if @answer == 'y'
      puts 'Игра начинается!'
      games
    elsif @answer == 'n'
      puts "Не хотите играть? Ваш выбор... Надеемся что вы к нам вернетесь."
    else
      puts "Ваш ответ недопустим! Попробуйте ответить еще раз."
      condition
    end
  end

  def games
    userTakeCard
  end

  def userTakeCard
  	@playerPoint = 0
    @pcPoint = 0
    puts 'Вам доступно ' + @playerMoney.to_s + '. Ваша ставка на эту игру?'
    @rate = gets.split(/[^\d]/).join
    if @rate.to_i <= @playerMoney.to_i
      # Раздаем карты перед началом игры. Две карты игроку и одну карту дилеру. Карта дилера открыта.
        currentDealerCard = $deckForGame.shift
        @pcDeck << currentDealerCard
        @pcPoint += $cardsDeck[currentDealerCard] 
        2.times do 
          currentCard = $deckForGame.shift
          @playerDeck << currentCard
          @playerPoint += $cardsDeck[currentCard]
        end

        puts 'Вам выпали карты: ' + @playerDeck.to_s + '. Сумма очков: ' + @playerPoint.to_s + '.'
        puts 'Дилер получил карту' + @pcDeck.to_s + '. Сумма очков дилера: ' + @pcPoint.to_s
      loop do
        if @playerPoint < 21
          puts 'Взять еще одну карту?[y\n]'
          @more = gets.chomp.downcase
        	if @more == 'y'
            currentCard = $deckForGame.shift
            @playerDeck << currentCard
            @playerPoint += $cardsDeck[currentCard]
            puts "Вам выпала карта: " + currentCard.to_s
            puts 'Текущие карты у вас: ' + @playerDeck.to_s + ' Что в сумме: ' + @playerPoint.to_s
          elsif @more == 'n'
            pcStage
            if @pcPoint < 21 && @playerPoint < 21
              if @playerPoint > @pcPoint
                puts 'Очки дилера:  ' + @pcPoint.to_s + '. А это значит, что вы победили!'
                playerWin
              elsif @playerPoint == @pcPoint
                puts 'Дилер и вы набрали одинаковое количество очков.'
              else
                puts 'Очки дилера =  ' + @pcPoint.to_s + '. So you loose!'
                playerLoose
              end
            elsif @pcPoint == 21 && @playerPoint < 21
              puts 'Дилер набрал: 21. Увы, вы проиграли!'
              playerLoose
              defaultValue
            elsif @pcPoint > 21 && @playerPoint < 21
              puts 'Дилер набрал:  ' + @pcPoint.to_s + '. Поздравляем, вы выиграли!'
              playerWin
              defaultValue
            end
            break
          else
            puts "Пожалуйста, отвечайте только 'y' или 'n'!"   
          end
        elsif @playerPoint == 21
        	puts "Поздравляем! Вы выиграли набрав 21!"
          playerWin
          defaultValue
          break
        elsif @playerPoint > 21
          puts 'Вы набрали больше 21, очень жаль, но вы проиграли! :('
          playerLoose
          defaultValue
          break
        else
          puts "Пожалуйста, отвечайте только 'y' или 'n'!"
        end
      end
    else
      puts 'Вы указали сумму, которой не располагаете. Укажите верную сумму!'
      userTakeCard
    end
    # Проверяем остаток денег у игрока
    if @playerMoney == 0
      puts 'К сожалению вы проиграли все выделенные на игру деньги. Не отчайвайтесь, возможно вам повезет в следующий раз!'
    else
      games
    end
  end

  def pcStage
    begin
      currentDealerCard = $deckForGame.shift
      @pcDeck << currentDealerCard
      @pcPoint += $cardsDeck[currentDealerCard]   
    end while @pcPoint >= 17
    puts @pcDeck
  end


  def getPlayername
    puts 'Игрок, представьтесь!'
    @playerName = gets.chomp
  end

  def getPlayerMoney
    puts 'Общая сумма из которой будут делаться ставки?'
    @playerMoney = gets.split(/[^\d]/).join
    puts @playerMoney
    if @playerMoney.to_i > 0
    else
      getPlayerMoney
    end
  end

  private

  def defaultValue
    @playerDeck = []
    @pcDeck = []
  end

  def playerWin
    @playerMoney = @playerMoney.to_i + @rate.to_i * 2
  end

  def playerLoose
    @playerMoney = @playerMoney.to_i - @rate.to_i
  end

end

game = Game.new