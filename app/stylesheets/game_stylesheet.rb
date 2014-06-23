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
    st.layer.cornerRadius = 7
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 13
  end

  def table_card_2(st)
    st.layer.cornerRadius = 7
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 72
  end

  def table_card_3(st)
    st.layer.cornerRadius = 7
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 131
  end

  def table_card_4(st)
    st.layer.cornerRadius = 7
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 190
  end

  def table_card_5(st)
    st.layer.cornerRadius = 7
    st.width = 57
    st.height = 75
    st.top = 175
    st.left = 249
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

  def overlay(st)
    st.top = 30
    st.left = 10
    st.height = 487
    st.width = 300
    st.background_color = color.from_rgba(0,53,81,0.75)
    st.layer.cornerRadius = 10
  end

  def win_text(st)
    st.font = rmq.font.super
    st.text_alignment = :center
    st.top = 30
    st.left = 10
    st.width = 300
    st.height = 100
    st.color = color.white
  end

  def win_total(st)
    st.font = rmq.font.large
    st.text_alignment = :center
    st.top = 110
    st.left = 10
    st.width = 300
    st.height = 35
    st.color = color.from_hex("f8fd2d")
  end

  def win_type(st)
    st.font = rmq.font.small
    st.text_alignment = :center
    st.top = 145
    st.left = 10
    st.width = 300
    st.height = 25
    st.color = color.white
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
  end

  def share_button(st)
    st.width = 150
    st.height = 50
    st.top = 340
    st.left = 85
    st.font = rmq.font.medium
    st.background_color = color.from_rgba(125,125,125,0.75)
    st.layer.cornerRadius = 10
    st.text = "Share"
  end

  def rate_button(st)
    st.width = 150
    st.height = 50
    st.top = 400
    st.left = 85
    st.font = rmq.font.medium
    st.background_color = color.from_rgba(125,125,125,0.75)
    st.layer.cornerRadius = 10
    st.text = "Rate"
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
