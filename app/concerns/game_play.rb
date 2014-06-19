module GamePlay

  def deal
    @quick_fire.deal
    deal_cards(:card_1, :card_2, :comp_card_1, :comp_card_2)
  end

  def flop
    @quick_fire.flop
    reveal_cards(:table_card_1, :table_card_2, :table_card_3)
  end

  def turn
    @quick_fire.turn
    reveal_cards(:table_card_4)
  end

  def river
    @quick_fire.river
    reveal_cards(:table_card_5)
  end

  def finished
    @quick_fire.finished
    winner = @quick_fire.to_hash[:winner]
    if winner[:id] == 1
      @game.score = @game.score * 2
      if winner[:rank] == "Straight Flush" || winner[:rank] == "Royal Flush"
        add_rebuy
      end
    elsif winner[:id] == 2
      if @game.rebuys == 0
        @game.open = false
        @game.rebuys = 0
        rmq(:play).style {|st| st.text = "Play Again?" }
      else
        @game.rebuys = @game.rebuys - 1
      end
    end
  end

  def next_hand
    if @quick_fire.game_status == :finished && @game.open
      @quick_fire = PokerMotion::QuickFire.new
      deal
    else
      start_new_game
    end
  end

  def start_new_game
    @quick_fire = PokerMotion::QuickFire.new
    rmq(:play).style {|st| st.text = "Play" }
    @game.score = 1
    @game.rebuys = 0
    @game.open = true
    deal
  end

  def add_rebuy
    @game.rebuys = @game.rebuys + 1
  end

end
