module Base
  class GameStylesheet < ApplicationStylesheet

    include Base::OverlayStylesheet

    def root_view(st)
      st.background_image = image.resource("background35")
    end

    def score(st)
      st.width = 300
      st.height = 50
      st.top = 26
      st.left = 10
      st.color = color.from_hex("f8fd2d")
      st.font = rmq.font.medium
      st.text_alignment = :center
    end

    def info(st)
      st.width = 25
      st.height = 25
      st.top = 42
      st.left = 20
      st.background_image = rmq.image.resource("info")
    end

    def settings(st)
      st.width = 25
      st.height = 25
      st.top = 42
      st.left = 275
      st.background_image = rmq.image.resource("settings")
    end

    def rebuys(st)
      st.width = 75
      st.height = 75
      st.top = 83
      st.left = 10
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
      st.width = 57
      st.height = 75
      st.top = 83
      st.left = 100
      st.background_image = rmq.image.resource("card_back")
    end

    def comp_card_2(st)
      st.width = 57
      st.top = 83
      st.height = 75
      st.left = 163
      st.background_image = rmq.image.resource("card_back")
    end

    def table_card_1(st)
      st.width = 57
      st.height = 75
      st.top = 163
      st.left = 13
    end

    def table_card_2(st)
      st.width = 57
      st.height = 75
      st.top = 163
      st.left = 72
    end

    def table_card_3(st)
      st.width = 57
      st.height = 75
      st.top = 163
      st.left = 131
    end

    def table_card_4(st)
      st.width = 57
      st.height = 75
      st.top = 163
      st.left = 190
    end

    def table_card_5(st)
      st.width = 57
      st.height = 75
      st.top = 163
      st.left = 249
    end

    def fold(st)
      st.width = 75
      st.height = 75
      st.top = 83
      st.left = 235
      st.layer.cornerRadius = 10
      st.background_color = color.from_hex("fd1b14")
      st.color = color.white
      st.font = rmq.font.small
      st.text = "Fold"
    end

    def play(st)
      st.top = 240
      st.width = 150
      st.height = 40
      st.left = 85
      st.font = rmq.font.medium
      st.background_color = color.from_hex("45b209")
      st.layer.cornerRadius = 10
      st.text = "Play"
    end

    def card_1(st)
      st.top = 283
      st.left = 45
      st.height = 146
      st.width = 110
    end

    def card_2(st)
      st.top = 283
      st.left = 165
      st.width = 110
      st.height = 146
    end

    def burn_icon_1(st)
      st.width = 12
      st.height = 12
      st.top = 324
      st.left = 138
    end

    def burn_icon_2(st)
      st.width = 12
      st.height = 12
      st.top = 324
      st.left = 258
    end

    def action_text(st)
      st.top = 55
      st.width = 300
      st.height = 30
      st.left = 10
      st.color = color.from_hex("ffffff")
      st.font = rmq.font.tiny
      st.text_alignment = :center
    end

    def folding(st)
      st.font = rmq.font.small
      st.text_alignment = :center
      st.top = 110
      st.left = 0
      st.width = 320
      st.height = 200
      st.color = color.from_hex("fd1b14")
      st.text = "FOLD"
    end

  end
end
