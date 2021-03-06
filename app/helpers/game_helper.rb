module GameHelper

  def rank_text
    if @quick_fire.game_status == :finished && @quick_fire.to_hash[:winner][:id] == 2
      return "#{@quick_fire.player(2).rank} beats #{@quick_fire.player(1).rank}"
    else
      return @quick_fire.player(1).rank
    end
  end

  def discard_cards(cards)
    cards.each do |card|
      start_pos = rmq(card).get.frame.origin.y
      start_height = rmq(card).get.frame.size.height
      opts = {
        duration: 0.2,
        animations: ->(c) {
          c.style do |st|
            st.frame = {t: start_pos - start_height}
            st.rotation = 175 if card == :card_1
            st.rotation = 185 if card == :card_2
            st.opacity = 0.5
          end
        },
        completion: ->(did_finish, q){
          if did_finish
            rmq(:card_1).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(1).card_1}_big") }
            rmq(:card_2).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(1).card_2}_big") }
            rmq(card).animate({
              duration: 0.25,
              animations: ->(c) {
                c.style do |st|
                  st.opacity = 1.0
                  st.rotation = 0
                  st.frame = {t: start_pos}
                end
              },
              completion: ->(finished, x) {
                if finished
                  redraw_scene
                end
              }
            })
          end
        }
      }
      rmq(card).animate(opts)
      card_deal_sound
    end
  end

  def deal_cards(*cards)
    cards.each do |card|
      hide_card(card)
    end
    rmq(:play).off
    rmq(:fold).off
    deal_card(0, cards)
  end

  def burn_comp_cards
    cards = [:comp_card_1, :comp_card_2]
    cards.each do |card|
      final_pos = rmq(card).get.frame.origin.y
      rmq(card).animate({
        duration: 0.25,
        animations: ->(c) {
          c.style do |st|
            st.rotation = 0
            st.frame = {t: 100}
          end
        },  completion: ->(did_finish, q){
          if did_finish
           comp_card_redeal(card,final_pos)
          end
        }
      })
    end
  end

  def comp_card_redeal(card, final_pos)
    card_deal_sound
    rmq(card).style do |st|
      st.rotation = card == :comp_card_1 ? 180 : 225
    end
    rmq(card).animate({
      duration: 0.25,
      animations: ->(c) {
        c.style do |st|
          st.rotation = 0
          st.frame = {t: final_pos}
        end
      }
    })
  end

  def burn_comp_card_2
    card = :comp_card_2
    hide_card(card)
    card_deal_sound
    final_pos = rmq(card).get.frame.origin.y
    rmq(card).style {|st| st.frame = {t: -100}; st.rotation = 0 }
    rmq(card).animate({
      duration: 0.25,
      animations: ->(c) {
        c.style do |st|
          st.opacity = 1.0
          st.rotation = 45
          st.frame = {t: final_pos}
        end
      }
    })
  end

  def deal_card(index, cards)
    card = cards[index]
    if card.nil?
      play_button
      fold_button
      redraw_scene
      return
    end
    card_deal_sound
    final_pos = rmq(card).get.frame.origin.y
    rmq(card).style {|st| st.frame = {t: -100}; st.rotation = 45 }
    rmq(card).animate({
      duration: 0.25,
      animations: ->(c) {
        c.style do |st|
          st.opacity = 1.0
          st.rotation = 0
          st.frame = {t: final_pos}
        end
      },
      completion: ->(did_finish, q){
        if did_finish
         deal_card(index + 1, cards)
        end
      }
    })
  end

  def hide_card(card)
    rmq(card).hide.style do |st|
      st.opacity = 0.0
      st.hidden = false
    end
  end

  def drop_cards(*cards)
    cards.each do |card|
      rmq(card).hide.style do |st|
        st.opacity = 0.1
        st.scale = 2.0
        st.hidden = false
      end
      opts = {
        duration: 0.5,
        animations: ->(c) {
          c.style do |st|
            st.opacity = 1.0
            st.scale = 1.0
          end
        }
      }
      rmq(card).animate(opts)
    end
  end

  def reveal_cards(*cards)
    cards.each do |card|
      rmq(card).hide.style do |st|
        st.opacity = 0.1
        st.scale = 0.3
        st.hidden = false
      end
      opts = {
        duration: 0.3,
        animations: ->(c) {
          c.style do |st|
            st.opacity = 1.0
            st.scale = 1.0
          end
        }
      }
      rmq(card).animate(opts)
    end
  end

end
