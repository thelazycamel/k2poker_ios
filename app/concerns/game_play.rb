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
    if @game.difficulty == 2 && @quick_fire.player(2).rank == "Highest Card" && @quick_fire.player(2).status != :discarded
      @quick_fire.player(2).burn
      burn_comp_cards
    end
  end

  #TODO Tidy up this nasty method
  def finished
    @quick_fire.finished
    winner = @quick_fire.to_hash[:winner]
    rebuy_added = false
    rebuy_used = false
    top_score_achieved = false
    previous_score = @game.score
    if winner[:id] == 1
      @game.score = @game.score * 2
      @game.high_score = @game.score if @game.score > @game.high_score
      rmq(:play).style {|st| st.text = "Next Hand" }
      if winner[:rank] == "Straight Flush" || winner[:rank] == "Royal Flush"
        rebuy_added = true
        add_rebuy(@game.score)
      end
      if @game.score == 1024 && !@game.rebuy_obtained
        add_rebuy(1024)
        rebuy_added = true
        @game.rebuy_obtained = true
      end
      if @game.score == 1048576 && !game.million_rebuy
        applause_sound
        add_rebuy(1048576)
        rebuy_added = true
        @game.million_rebuy = true
      end
      if @game.score >= 274877906944
        applause_sound
        @game.open = false
        top_score_achieved = true
        rmq(:play).style {|st| st.text = "Game Over"}
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
    opts_hash = {rebuy_added: rebuy_added, rebuy_used: rebuy_used, previous_score: previous_score, top_score_achieved: top_score_achieved}
    OverlayController.new(self, @game, @quick_fire, opts_hash).show
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
    @game.score = 1
    @game.rebuys = []
    @game.rebuy_obtained = false
    @game.million_rebuy = false
    @game.open = true
    deal
  end

  def add_rebuy(value)
    @game.rebuys << value
    @game.rebuys.sort.reverse
  end

end
