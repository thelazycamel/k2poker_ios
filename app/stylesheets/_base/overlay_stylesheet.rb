module Base
  module OverlayStylesheet

    def overlay(st)
      if rmq.device.four_inch?
        st.frame = {t: 0, l:0, h:518, w:320}
      else
        st.frame = {t: 0, l:0, h:430, w:320}
      end
      st.background_color = color.from_rgba(0,53,81,0.90)
    end

    def overlay_close(st)
      st.frame = {t: 42, l:275, h:25, w:25}
      st.background_color = color.from_hex("fd1b14")
      st.color = color.white
      st.text = "X"
      st.layer.cornerRadius = 12
      st.font = rmq.font.small
    end

    def win_text(st)
      st.font = rmq.font.large
      st.text_alignment = :center
      if rmq.device.four_inch?
        st.frame = {t: 30, l:10, h:50, w:300}
      else
        st.frame = {t: 0, l:10, h: 50, w:320}
      end
      st.color = color.white
    end

    def win_total(st)
      st.font = rmq.font.large
      st.text_alignment = :center
      st.frame = { below_prev: 7, l:10, h:35, w:300}
      st.color = color.from_hex("f8fd2d")
    end

    def win_type(st)
      st.font = rmq.font.small
      st.text_alignment = :center
      st.frame = { below_prev: 7, l: 10, w:300, h:25}
      st.color = color.white
    end

    def rebuy_awarded(st)
      st.frame = { t: 245, l: 25, w:75, h:75}
      st.background_image = rmq.image.resource("rebuy_awarded")
    end

    def rebuy_used(st)
      st.frame = { t: 245, l: 225, w:50, h:50}
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
      st.frame = {h: 50}
    end

    def high_score(st)
      st.font = rmq.font.medium
      st.text_alignment = :center
      st.frame = {t: 340, l: 60, w: 200, h: 100}
      st.color = color.from_hex("f8fd2d")
      st.view.lineBreakMode = NSLineBreakByWordWrapping
      st.view.numberOfLines = 2
    end

    def share_button(st)
      if rmq.device.four_inch?
        st.frame = {t: 340, l: 85, w: 150, h: 50}
      else
        st.frame = {t: 300, l: 85, w: 150, h: 50}
      end
      st.font = rmq.font.medium
      st.background_color = color.from_rgba(125,125,125,0.75)
      st.layer.cornerRadius = 10
      st.text = "Share"
    end

    def rate_button(st)
      if rmq.device.four_inch?
        st.frame = {t: 400, l: 85, w: 150, h: 50}
      else
        st.frame = {t: 360, l: 85, w: 150, h: 50}
      end
      st.font = rmq.font.medium
      st.background_color = color.from_rgba(125,125,125,0.75)
      st.layer.cornerRadius = 10
      st.text = "Rate"
    end
  end

end
