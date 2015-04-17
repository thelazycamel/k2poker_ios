module Base
  module OverlayStylesheet

    def overlay(st)
      st.top = 0
      st.left = 0
      if rmq.device.four_inch?
        st.height = 518
      else
        st.height = 430
      end
      st.width = 320
      st.background_color = color.from_rgba(0,53,81,0.90)
    end

    def overlay_close(st)
      st.width = 25
      st.height = 25
      st.top = 42
      st.left = 275
      st.background_color = color.from_hex("fd1b14")
      st.color = color.white
      st.text = "X"
      st.layer.cornerRadius = 12
      st.font = rmq.font.small
    end

    def win_text(st)
      st.font = rmq.font.large
      st.text_alignment = :center
      st.top = 19
      st.left = 10
      st.width = 300
      st.height = 70
      st.color = color.white
    end

    def win_total(st)
      st.font = rmq.font.large
      st.text_alignment = :center
      st.frame = { below_prev: 7 }
      st.left = 10
      st.width = 300
      st.height = 35
      st.color = color.from_hex("f8fd2d")
    end

    def win_type(st)
      st.font = rmq.font.small
      st.text_alignment = :center
      st.frame = { below_prev: 7}
      st.left = 10
      st.width = 300
      st.height = 25
      st.color = color.white
    end

    def rebuy_awarded(st)
      st.width = 75
      st.height = 75
      st.top = 245
      st.left = 25
      st.background_image = rmq.image.resource("rebuy_awarded")
    end

    def rebuy_used(st)
      st.width = 50
      st.height = 50
      st.top = 245
      st.left = 225
      st.background_image = rmq.image.resource("rebuy_used")
    end

    def win_card_1(st)
      table_card_1 st
    end

    def win_card_2(st)
      table_card_2 st
    end

    def win_card_3(st)
      table_card_3 st
    end

    def win_card_4(st)
      table_card_4 st
    end

    def win_card_5(st)
      table_card_5 st
    end

    def win_button(st)
      play st
      st.height = 50
    end

    def high_score(st)
      st.font = rmq.font.medium
      st.text_alignment = :center
      st.top = 340
      st.left = 60
      st.width = 200
      st.height = 100
      st.color = color.from_hex("f8fd2d")
      st.view.lineBreakMode = NSLineBreakByWordWrapping
      st.view.numberOfLines = 2
    end

    def share_button(st)
      st.width = 150
      st.height = 50
      st.top = rmq.device.four_inch? ? 340 : 300
      st.left = 85
      st.font = rmq.font.medium
      st.background_color = color.from_rgba(125,125,125,0.75)
      st.layer.cornerRadius = 10
      st.text = "Share"
    end

    def rate_button(st)
      st.width = 150
      st.height = 50
      st.top = rmq.device.four_inch? ? 400 : 360
      st.left = 85
      st.font = rmq.font.medium
      st.background_color = color.from_rgba(125,125,125,0.75)
      st.layer.cornerRadius = 10
      st.text = "Rate"
    end
  end

end
