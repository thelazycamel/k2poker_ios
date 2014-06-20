module EventListeners

  def set_up_events
    play_button
    fold_button
    card_1
    card_2
  end

  def play_button
    rmq(:play).on(:touch) do |sender|
      case @quick_fire.game_status
      when :start
        deal
      when :deal
        flop
      when :flop
        turn
      when :turn
        river
      when :river
        finished
      when :finished
        next_hand
      end
      redraw_scene
    end
  end

  def fold_button
    rmq(:fold).on(:touch) do |sender|
      if @game.score > 1
        @game.score = @game.score / 2
      end
      @quick_fire = PokerMotion::QuickFire.new
      @quick_fire.deal
      redraw_scene
    end
  end

  def card_1
    rmq(:card_1).on(:swipe_up) do |sender|
      if @quick_fire.player(1).status != :discarded
        if @quick_fire.game_status == :deal || @quick_fire.game_status == :flop || @quick_fire.game_status == :turn
          cards = [:card_1]
          @quick_fire.player(1).discard(:card_1)
          discard_cards(cards)
        elsif @quick_fire.game_status == :river
          cards = [:card_1, :card_2]
          @quick_fire.player(1).burn
          discard_cards(cards)
        end
      end
    end
  end

  def card_2
    rmq(:card_2).on(:swipe_up) do |sender|
      if @quick_fire.player(1).status != :discarded
        if @quick_fire.game_status == :deal || @quick_fire.game_status == :flop || @quick_fire.game_status == :turn
          cards = [:card_2]
          @quick_fire.player(1).discard(:card_2)
          discard_cards(cards)
        elsif @quick_fire.game_status == :river
          cards = [:card_1, :card_2]
          @quick_fire.player(1).burn
          discard_cards(cards)
        end
      end
    end
  end

end
