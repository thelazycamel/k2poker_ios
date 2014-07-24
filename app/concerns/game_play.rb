module GamePlay

  #REFACTOR THIS INTO A CLASS

  def deal
    @quick_fire.deal
    rmq(:card_1).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(1).card_1}_big") }
    rmq(:card_2).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(1).card_2}_big") }
    deal_cards(:card_1, :comp_card_1, :card_2, :comp_card_2)
  end

  def flop
    @quick_fire.flop
    deal_cards(:table_card_1, :table_card_2, :table_card_3)
  end

  def turn
    @quick_fire.turn
    deal_cards(:table_card_4)
  end

  def river
    @quick_fire.river
    deal_cards(:table_card_5)
  end

  #TODO Tidy up this nasty method
  def finished
    @quick_fire.finished
    winner = @quick_fire.to_hash[:winner]
    @game.high_score = @game.score if @game.score > @game.high_score
    rebuy_added = false
    rebuy_used = false
    previous_score = @game.score
    if winner[:id] == 1
      rmq(:play).style {|st| st.text = "Next Hand" }
      if winner[:rank] == "Straight Flush" || winner[:rank] == "Royal Flush"
        add_rebuy(@game.score)
      end
      @game.score = @game.score * 2
      if @game.score == 1024 && !@game.rebuy_obtained
        add_rebuy(1024)
        rebuy_added = true
        @game.rebuy_obtained = true
      end
    elsif winner[:id] == 2
      if @game.rebuys.empty?
        @game.open = false
        rmq(:play).style {|st| st.text = "Play Again?" }
      else
        rebuy_used = true
        @game.score = @game.rebuys.shift
      end
    end
    show_overlay(rebuy_added, rebuy_used, previous_score)
  end

  def next_hand
    rmq(:play).style {|st| st.text = "Play" }
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
    @game.score = 512
    @game.rebuys = []
    @game.rebuy_obtained = false
    @game.open = true
    deal
  end

  def add_rebuy(value)
    @game.rebuys << value
    @game.rebuys.sort
  end

end
