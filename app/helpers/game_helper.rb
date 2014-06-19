module GameHelper

  def deal_cards(*cards)
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
