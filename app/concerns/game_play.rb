module GamePlay

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
      @quick_fire.deal
    else
      start_new_game
    end
  end

  def start_new_game
    @quick_fire = PokerMotion::QuickFire.new
    rmq(:play).style {|st| st.text = "Play" }
    @quick_fire.deal
    @game.score = 1
    @game.rebuys = 0
    @game.open = true
  end

  def add_rebuy
    @game.rebuys = @game.rebuys + 1
  end

end
