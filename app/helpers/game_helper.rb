module GameHelper

  def deal_cards
    cards.each do |card|
      hide_card(card)
    end
    deal_card_1
  end

  def hide_card(card)
    rmq(card).hide.style do |st|
      st.opacity = 0.1
      st.hidden = false
      st.top = -200
      st.rotation = 45
    end
  end

  def deal_card_1
    rmq(:card_1).animate({
      duration: 0.2,
      animations: ->(c) {
        c.style do |st|
          st.opacity = 1.0
          st.rotation = 0
          st.top = 320
        end
      },
      completion: ->(did_finish, q){
        if did_finish
          deal_card_2
        end
      }
    })
  end

  def deal_card_2
    rmq(:comp_card_1).animate({
      duration: 0.1,
      animations: ->(c) {
        c.style do |st|
          st.opacity = 1.0
          st.rotation = 0
          st.top = 90
        end
      },
      completion: ->(did_finish, q){
        if did_finish
          deal_card_3
        end
      }
    })
  end

  def deal_card_3
    rmq(:card_2).animate({
      duration: 0.2,
      animations: ->(c) {
        c.style do |st|
          st.opacity = 1.0
          st.rotation = 0
          st.top = 320
        end
      },
      completion: ->(did_finish, q){
        if did_finish
          deal_card_4
        end
      }
    })
  end

  def deal_card_4
    rmq(:comp_card_2).animate({
      duration: 0.1,
      animations: ->(c) {
        c.style do |st|
          st.opacity = 1.0
          st.rotation = 0
          st.top = 90
        end
      }
    })
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
