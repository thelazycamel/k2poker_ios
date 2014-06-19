class GameStylesheet < ApplicationStylesheet

  def root_view(st)
    st.background_image = image.resource("background")
  end

  def score(st)
    st.width = 300
    st.height = 50
    st.top = 30
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
    st.top = 90
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
    st.top = 90
    st.left = 100
    st.background_image = rmq.image.resource("card_back")
  end

  def comp_card_2(st)
    st.width = 57
    st.height = 75
    st.top = 90
    st.left = 163
    st.background_image = rmq.image.resource("card_back")
  end

  def table_card_1(st)
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 10
  end

  def table_card_2(st)
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 70
  end

  def table_card_3(st)
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 131
  end

  def table_card_4(st)
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 191
  end

  def table_card_5(st)
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 251
  end

  def fold(st)
    st.width = 75
    st.height = 75
    st.top = 90
    st.left = 235
    st.layer.cornerRadius = 10
    st.background_color = color.from_hex("fd1b14")
    st.color = color.white
    st.font = rmq.font.small
    st.text = "Fold"
  end

  def play(st)
    st.width = 150
    st.height = 50
    st.top = 260
    st.left = 85
    st.font = rmq.font.medium
    st.background_color = color.from_hex("45b209")
    st.layer.cornerRadius = 10
    st.text = "Play"
  end

  def card_1(st)
    st.width = 110
    st.height = 146
    st.top = 320
    st.left = 45
  end

  def card_2(st)
    st.width = 110
    st.height = 146
    st.top = 320
    st.left = 165
  end

  def action_text(st)
    st.top = 470
    st.width = 300
    st.height = 30
    st.left = 10
    st.color = color.from_hex("0565b0")
    st.font = rmq.font.small
    st.text_alignment = :center
  end

end
