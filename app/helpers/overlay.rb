module Overlay

  def show_overlay
    rmq.wrap(rmq.app.window).tap do |ol|
      ol.append(UIView, :overlay).animations.fade_in(duration: 1)
      ol.append(UIButton, :overlay_close).animations.fade_in(duration: 1)
      ol.append(UILabel, :win_text).animations.fade_in(duration: 1)
      ol.append(UILabel, :win_total).animations.fade_in(duration: 1)
      ol.append(UILabel, :win_type).animations.fade_in(duration: 1)
      ol.append(UIButton, :win_card_1).animations.fade_in(duration: 1)
      ol.append(UIButton, :win_card_2).animations.fade_in(duration: 1)
      ol.append(UIButton, :win_card_3).animations.fade_in(duration: 1)
      ol.append(UIButton, :win_card_4).animations.fade_in(duration: 1)
      ol.append(UIButton, :win_card_5).animations.fade_in(duration: 1)
      ol.append(UIButton, :win_button).animations.fade_in(duration: 1)

      overlay_elements = [:win_button, :overlay, :overlay_close, :win_text, :win_total, :win_type, :win_card_1, :win_card_2, :win_card_3, :win_card_4, :win_card_5, :share_button, :rate_button, :high_score]

      ol.find(:win_button).on(:touch) do |sender|
        ol.find(overlay_elements).hide.remove
        next_hand
        redraw_scene
      end

      ol.find(:overlay_close).on(:touch) do |sender|
        ol.find(overlay_elements).hide.remove
      end

    end

    winner = @quick_fire.to_hash[:winner]
    overlay_win if winner[:id] == 1
    overlay_draw if winner[:draw] == true
    overlay_lose if winner[:id] == 2
  end

  def overlay_win
    rmq(rmq.app.window).find(:win_text).style {|st| st.text = "WIN"}
    rmq(rmq.app.window).find(:win_total).style {|st| st.text = formatted_score(@game.score)  }
    rmq(rmq.app.window).find(:win_type).style {|st| st.text = @quick_fire.to_hash[:winner][:rank] }
    display_overlay_winning_cards
    display_win_button("Next Hand")
    display_share_buttons
  end

  def overlay_lose
    rmq(rmq.app.window).find(:win_text).style {|st| st.text = "LOSE"; st.color = rmq.color.from_hex("fd1b14")}
    rmq(rmq.app.window).find(:win_total).style {|st| st.text = formatted_score(@game.score); st.color = rmq.color.from_hex("fd1b14") }
    rmq(rmq.app.window).find(:win_type).style {|st| st.text = @game.score == @game.high_score ? "New High Score" : "Beaten By" }
    display_overlay_winning_cards
    display_win_button("Play Again?")
    if @game.score == @game.high_score
      display_share_buttons
    else
      rmq(rmq.app.window).append(UILabel, :high_score).animations.fade_in(duration: 1).style {|st| st.text = "Highest Score #{formatted_score(@game.high_score)}" }
    end
  end

  def overlay_draw
    rmq(rmq.app.window).find(:win_text).style {|st| st.text = "DRAW"; st.color = rmq.color.from_hex("f8fd2d")}
    rmq(rmq.app.window).append(UILabel, :high_score).animations.fade_in(duration: 1).style {|st| st.text = "Highest Score #{formatted_score(@game.high_score)}" }
  end

  def overlay_rebuy

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

end
