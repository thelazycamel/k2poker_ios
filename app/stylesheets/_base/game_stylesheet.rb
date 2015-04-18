module Base
  class GameStylesheet < ApplicationStylesheet

    include Base::OverlayStylesheet

    def root_view(st)
      st.background_image = image.resource("background35")
    end

    def score(st)
      st.frame = {w: 300, h: 50, t: 26, l: 10}
      st.color = color.from_hex("f8fd2d")
      st.font = rmq.font.medium
      st.text_alignment = :center
    end

    def info(st)
      st.frame = {w: 25, h: 25, t: 42, l: 20}
      st.background_image = rmq.image.resource("info")
    end

    def settings(st)
      st.frame = {w: 25, h: 25, t: 42, l: 275}
      st.background_image = rmq.image.resource("settings")
    end

    def rebuys(st)
      st.frame = {w: 75, h: 75, t: 83, l: 10}
      st.view.clipsToBounds = "YES"
      st.layer.cornerRadius = 10
      st.background_color = color.from_hex("45b209")
      st.color = color.white
      st.font = rmq.font.small
      st.view.lineBreakMode = NSLineBreakByWordWrapping
      st.view.textAlignment = NSTextAlignmentCenter
      st.view.numberOfLines = 0
      st.view.text = "Rebuys 0"
    end

    def comp_card_1(st)
      st.frame = {w: 57, h: 75, t: 83, l: 100}
      st.background_image = rmq.image.resource("card_back")
    end

    def comp_card_2(st)
      st.frame = {w: 57, h: 75, t: 83, l: 163}
      st.background_image = rmq.image.resource("card_back")
    end

    def table_card_1(st)
      st.frame = {w: 57, h: 75, t: 163, l: 13}
    end

    def table_card_2(st)
      st.frame = {w: 57, h: 75, t: 163, l: 72}
    end

    def table_card_3(st)
      st.frame = {w: 57, h: 75, t: 163, l: 131}
    end

    def table_card_4(st)
      st.frame = {w: 57, h: 75, t: 163, l: 190}
    end

    def table_card_5(st)
      st.frame = {w: 57, h: 75, t: 163, l: 249}
    end

    def fold(st)
      st.frame = {w: 75, h: 75, t: 83, l: 235}
      st.layer.cornerRadius = 10
      st.background_color = color.from_hex("fd1b14")
      st.color = color.white
      st.font = rmq.font.small
      st.text = "Fold"
    end

    def play(st)
      st.frame = {w: 150, h: 40, t: 240, l: 85}
      st.font = rmq.font.medium
      st.background_color = color.from_hex("45b209")
      st.layer.cornerRadius = 10
      st.text = "Play"
    end

    def card_1(st)
      st.frame = {w: 110, h: 146, t: 283, l: 45}
      st.font = rmq.font.medium
    end

    def card_2(st)
      st.frame = {w: 110, h: 146, t: 283, l: 165}
    end

    def burn_icon_1(st)
      st.frame = {w: 12, h: 12, t: 324, l: 138}
    end

    def burn_icon_2(st)
      st.frame = {w: 12, h: 12, t: 324, l: 258}
    end

    def action_text(st)
      st.frame = {w: 300, h: 30, t: 55, l: 10}
      st.color = color.from_hex("ffffff")
      st.font = rmq.font.tiny
      st.text_alignment = :center
    end

    def folding(st)
      st.font = rmq.font.small
      st.text_alignment = :center
      st.frame = {w: 320, h: 200, t: 110, l: 0}
      st.color = color.from_hex("fd1b14")
      st.text = "FOLD"
    end

  end
end
