module EventListeners

  def set_up_events
    info_button
    settings_button
    play_button
    fold_button
    card_1
    card_2
    table_cards_button
  end

  def info_button
    rmq(self.view).on(:swipe_left) do |sender|
      load_info_navigation
    end

    rmq(:info).on(:touch) do |sender|
      load_info_navigation
    end
  end

  #TODO move this method elsewhere
  def load_info_navigation
      tabbar = UITabBarController.alloc.init
      tabbar.viewControllers = [
        InfoOneController.alloc.initWithNibName(nil, bundle:nil),
        InfoTwoController.alloc.initWithNibName(nil, bundle:nil),
        InfoThreeController.alloc.initWithNibName(nil, bundle:nil)
      ]
      tabbar.selectedIndex = 0
      self.navigationController.pushViewController(tabbar, animated: true)
  end

  def settings_button
    rmq(:settings).on(:touch) do |sender|
      controller = SettingsController.alloc.initWithNibName(nil, bundle:nil)
      self.navigationController.pushViewController(controller, animated: true)
    end
  end

  def table_cards_button
    [:table_card_1, :table_card_2, :table_card_3, :table_card_4, :table_card_5].each do |card|
     rmq(card).on(:touch) do |sender|
       unless @quick_fire.game_status == :deal || @quick_fire.game_status == :start
         rmq(:action_text).animations.throb
         rmq(:ranked).animations.throb
       end
     end
    end
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
      rmq(:fold).off
      unless  @quick_fire.game_status == :finished
        if @game.score > 1
          @game.score = @game.score / 2
        end
        rmq.append(UILabel, :folding)
        opts = {
          duration: 0.6,
          animations: ->(ct){
            ct.style do |st|
              st.scale = 4
              st.opacity = 0.0
            end
          },
          completion: ->(did_finish, q){
            if did_finish
              @quick_fire = PokerMotion::QuickFire.new
              rmq(:card_1, :card_2, :comp_card_1, :comp_card_2, :table_card_1, :table_card_2, :table_card_3, :table_card_4, :table_card_5).reapply_styles
              redraw_scene
              q.hide.remove
              fold_button
              deal
            end
          }
        }
        #TODO alter this to do a chain of events passing one card after the other perhaps just drop and fade, on the last one clean up 
        rmq(:card_1, :card_2, :comp_card_1, :comp_card_2, :table_card_1, :table_card_2, :table_card_3, :table_card_4, :table_card_5).animations.drop_and_spin
        fold_sound
        rmq(:folding).animate(opts)
      end
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
