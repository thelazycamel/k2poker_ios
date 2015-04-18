module Five
  class GameStylesheet < Base::GameStylesheet

    def root_view(st)
      super
      st.background_image = image.resource("background")
    end

    def score(st)
      super
      st.frame = {t: 30}
    end

    def rebuys(st)
      super
      st.frame = {t: 90}
    end

    def comp_card_1(st)
      super
      st.frame = {t: 90}
    end

    def comp_card_2(st)
      super
      st.frame = {t: 90}
    end

    def table_card_1(st)
      super
      st.frame = {t: 175}
    end

    def table_card_2(st)
      super
      st.frame = {t: 175}
    end

    def table_card_3(st)
      super
      st.frame = {t: 175}
    end

    def table_card_4(st)
      super
      st.frame = {t: 175}
    end

    def table_card_5(st)
      super
      st.frame = {t: 175}
    end

    def fold(st)
      super
      st.frame = {t: 90}
    end

    def play(st)
      super
      st.frame = {t: 260, h: 50}
    end

    def card_1(st)
      super
      st.frame = {t: 320}
    end

    def card_2(st)
      super
      st.frame = {t: 320}
    end

    def action_text(st)
      super
      st.frame = {t: 475}
      st.color = color.from_hex("0565b0")
      st.font = rmq.font.small
    end

  end
end
