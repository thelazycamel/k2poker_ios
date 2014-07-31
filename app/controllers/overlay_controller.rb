class OverlayController

  include SoundsHelper

  VIEWS = {
    overlay: UIView,
    overlay_close: UIButton,
    win_text: UILabel,
    win_total: UILabel,
    win_type: UILabel,
    win_button: UIButton,
    win_card_1: UIButton,
    win_card_2: UIButton,
    win_card_3: UIButton,
    win_card_4: UIButton,
    win_card_5: UIButton
  }

  OPTIONAL_VIEWS = {
    share_button: UIButton,
    rate_button: UIButton,
    rebuy_awarded: UILabel,
    rebuy_used: UILabel,
    high_score: UILabel
   }

  def initialize(game_controller, game, quick_fire, opts ={})
    @game_controller = game_controller
    @game = game
    @quick_fire = quick_fire
    @rebuy_added = opts[:rebuy_added]
    @rebuy_used = opts[:rebuy_used]
    @previous_score = opts[:previous_score]
    @top_score_achieved = opts[:top_score_achieved]
  end

  def show
   rmq.wrap(rmq.app.window).tap do |overlay|
     VIEWS.each do |name, view_type|
       overlay.append(view_type, name).animations.fade_in(duration: 1)
     end
    add_event_listeners(overlay)
   end
   show_win_detail if winner[:id] == 1
   show_draw_detail if winner[:draw] == true
   show_lose_detail if winner[:id] == 2
  end

  def remove
    rmq(rmq.app.window).find(all_overlay_elements).hide.remove
  end

  private

  def all_overlay_elements
    VIEWS.merge(OPTIONAL_VIEWS).collect{|k,v| k}
  end

  def show_win_detail
    win_sound
    rmq(rmq.app.window).append(UILabel, :rebuy_awarded).animations.fade_in(duration: 1) if @rebuy_added
    rmq(rmq.app.window).find(:win_text).style {|st| st.text = "WIN"}
    rmq(rmq.app.window).find(:win_total).style {|st| st.text = formatted_score(@game.score)  }
    rmq(rmq.app.window).find(:win_type).style {|st| st.text = @quick_fire.to_hash[:winner][:rank] }
    display_overlay_winning_cards
    button_text = @top_score_achieved ? "Game Over" : "Next Hand"
    display_win_button(button_text)
    display_share_buttons
  end

  def show_draw_detail
    rmq(rmq.app.window).find(:win_text).style {|st| st.text = "DRAW"; st.color = rmq.color.from_hex("f8fd2d")}
    rmq(rmq.app.window).append(UILabel, :high_score).animations.fade_in(duration: 1).style {|st| st.text = "Highest Score #{formatted_score(@game.high_score)}" }
  end

  def show_lose_detail
    lose_sound
    score = @rebuy_used ? formatted_score(previous_score) : formatted_score(@game.score)
    rmq(rmq.app.window).append(UILabel, :rebuy_used).animations.fade_in(duration: 1) if @rebuy_used
    rmq(rmq.app.window).find(:win_text).style {|st| st.text = "LOSE"; st.color = rmq.color.from_hex("fd1b14")}
    rmq(rmq.app.window).find(:win_total).style {|st| st.text = score; st.color = rmq.color.from_hex("fd1b14") }
    rmq(rmq.app.window).find(:win_type).style {|st| st.text = @game.score == @game.high_score ? "New High Score" : "Beaten By" }
    display_overlay_winning_cards
    button_text = @rebuy_used ? "Play" : "Play Again?"
    display_win_button(button_text)
    if @game.score == @game.high_score
      display_share_buttons
    else
      rmq(rmq.app.window).append(UILabel, :high_score).animations.fade_in(duration: 1).style {|st| st.text = "Highest Score #{formatted_score(@game.high_score)}" }
    end
  end

  def display_overlay_winning_cards
    rmq(rmq.app.window).find(:win_card_1).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.to_hash[:winner][:hand][0]}_small") }
    rmq(rmq.app.window).find(:win_card_2).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.to_hash[:winner][:hand][1]}_small") }
    rmq(rmq.app.window).find(:win_card_3).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.to_hash[:winner][:hand][2]}_small") }
    rmq(rmq.app.window).find(:win_card_4).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.to_hash[:winner][:hand][3]}_small") }
    rmq(rmq.app.window).find(:win_card_5).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.to_hash[:winner][:hand][4]}_small") }
  end

  def display_win_button(text)
    rmq(rmq.app.window).find(:win_button).style {|st| st.text = text}
  end

  def display_share_buttons
    rmq(rmq.app.window).append(UIButton, :share_button).animations.fade_in(duration:1)
    rmq(rmq.app.window).append(UIButton, :rate_button).animations.fade_in(duration:1)
  end

  def winner
    @quick_fire.to_hash[:winner]
  end

  def add_event_listeners(overlay)
    overlay.find(:win_button).on(:touch) do |sender|
      remove
      @game_controller.next_hand
    end

    overlay.find(:overlay_close).on(:touch) do |sender|
      remove
    end
  end

end
