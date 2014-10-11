module Base
  class InfoStylesheet < ApplicationStylesheet

    @size = 32
    @top = 40

    def root_view(st)
      st.background_image = rmq.image.resource("info1")
    end

    def high_score(st)
      st.top = 400
      st.left = 10
      st.width = 300
      st.height = 25
      st.text_alignment = :center
      st.font = rmq.font.with_name("Helvetica Neue", 20)
      st.color = color.from_hex("f8fd2d")
    end

    def score_0(st)
      st.top = 70
      st.left = 10
      st.width = 300
      st.height = 30
      st.color = color.from_hex("53b2fc")
      st.text_alignment = :center
      st.font = rmq.font.with_name("Helvetica Neue", 30)
    end

    def score_1(st)
      score_0(st)
      st.frame = { below_prev: 0.1 }
      st.height = 28.5
      st.font = rmq.font.with_name("Helvetica Neue", 28.5)
    end

    def score_2(st)
      score_1(st)
      st.height = 27
      st.font = rmq.font.with_name("Helvetica Neue", 27)
    end

    def score_3(st)
      score_1(st)
      st.height = 25.5
      st.font = rmq.font.with_name("Helvetica Neue", 25.5)
    end

    def score_4(st)
      score_1(st)
      st.height = 24
      st.font = rmq.font.with_name("Helvetica Neue", 24)
    end

    def score_5(st)
      score_1(st)
      st.height = 22.5
      st.font = rmq.font.with_name("Helvetica Neue", 22.5)
    end

    def score_6(st)
      score_1(st)
      st.height = 21
      st.font = rmq.font.with_name("Helvetica Neue", 21)
    end

    def score_7(st)
      score_1(st)
      st.height = 19.5
      st.font = rmq.font.with_name("Helvetica Neue", 19.5)
    end

    def score_8(st)
      score_1(st)
      st.height = 18
      st.font = rmq.font.with_name("Helvetica Neue", 18)
    end

    def score_9(st)
      score_1(st)
      st.height = 16.5
      st.font = rmq.font.with_name("Helvetica Neue", 16.5)
    end

    def score_10(st)
      score_1(st)
      st.height = 15
      st.font = rmq.font.with_name("Helvetica Neue", 15)
    end

    def score_11(st)
      score_1(st)
      st.height = 13.5
      st.font = rmq.font.with_name("Helvetica Neue", 13.5)
    end

    def score_12(st)
      score_1(st)
      st.height = 12
      st.font = rmq.font.with_name("Helvetica Neue", 12)
    end

    def score_13(st)
      score_1(st)
      st.height = 10.5
      st.font = rmq.font.with_name("Helvetica Neue", 10.5)
    end

    def score_14(st)
      score_1(st)
      st.height = 9
      st.font = rmq.font.with_name("Helvetica Neue", 9)
    end

    def score_15(st)
      score_1(st)
      st.height = 7.5
      st.font = rmq.font.with_name("Helvetica Neue", 7.5)
    end

    def score_16(st)
      score_1(st)
      st.height = 6
      st.font = rmq.font.with_name("Helvetica Neue", 6)
    end

    def score_17(st)
      score_1(st)
      st.height = 6
      st.font = rmq.font.with_name("Helvetica Neue", 6)
    end

    def score_18(st)
      score_1(st)
      st.height = 5
      st.font = rmq.font.with_name("Helvetica Neue", 5)
    end

    def score_19(st)
      score_1(st)
      st.height = 4
      st.font = rmq.font.with_name("Helvetica Neue", 4)
    end

    def score_20(st)
      score_1(st)
      st.height = 3
      st.font = rmq.font.with_name("Helvetica Neue", 3)
    end

    def royal_flush(st)
      st.width = 141
      st.height = 35
      st.top = 70
      st.left = 150
      st.background_image = rmq.image.resource("royal_flush")
    end

    def straight_flush(st)
      royal_flush(st)
      st.frame = { below_prev: 1 }
      st.background_image = rmq.image.resource("straight_flush")
    end

    def four_of_a_kind(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("four_of_a_kind")
    end

    def full_house(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("full_house")
    end

    def flush(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("flush")
    end

    def straight(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("straight")
    end

    def three_of_a_kind(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("three_of_a_kind")
    end

    def two_pair(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("two_pair")
    end

    def pair(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("pair")
    end

    def high_card(st)
      straight_flush(st)
      st.background_image = rmq.image.resource("high_card")
    end

    def royal_flush_text(st)
      st.top = 75
      st.left = 20
      st.width = 130
      st.height = 25
      st.font = rmq.font.small
      st.color = color.white
      st.text = "Royal Flush"
    end

    def straight_flush_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 10 }
      st.text = "Straight Flush"
    end

    def four_of_a_kind_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "Four of a Kind"
    end

    def full_house_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "Full House"
    end

    def flush_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "Flush"
    end

    def straight_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "Straight"
    end

    def three_of_a_kind_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "Three of a Kind"
    end

    def two_pair_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "Two Pair"
    end

    def pair_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "Pair"
    end

    def high_card_text(st)
      royal_flush_text(st)
      st.frame = { below_prev: 11 }
      st.text = "High Card"
    end

    def scroll_area(st)
    end

    def rules(st)
      st.view.numberOfLines = 0
      st.view.lineBreakMode = NSLineBreakByWordWrapping
      st.color = color.white
      st.font = rmq.font.small
      st.frame = {l: 10, w: 300}
    end

    def title(st)
      st.color = color.from_hex("f8fd2d")
      st.font = rmq.font.small
      st.frame = {l: 10, w: 300, h: 21}
    end

    def title_1(st)
      title(st)
      st.text_alignment = :center
      st.text = "K2 Rules"
      st.frame = {t: 0 }
    end

    def rules_1(st)
      rules(st)
      st.frame = {h: 147, below_prev: 5}
      st.text = "Become the king of poker with just $1 in your pocket, double up until you reach $1 Million, playing a variation of everyones favourite ‘Texas Hold’em. The rules are very simple, especially if you have played any form of poker before."
    end

    def title_2(st)
      title(st)
      st.frame = { below_prev: 10, w: 300 }
      st.text = "Round 1 (The Deal)"
    end

    def rules_2(st)
      rules(st)
      st.frame = { below_prev: 5, h: 84 }
      st.text ="Two cards are dealt to yourself and your opponent, you can discard (swipe up) either card to try and obtain a better hand."
    end

    def title_3(st)
      title(st)
      st.frame = { below_prev: 10 }
      st.text = "Round 2 (The Flop)"
    end

    def rules_3(st)
      rules(st)
      st.frame = { below_prev: 5, h: 63 }
      st.text = "Three cards are dealt to the table, again you can discard one of the cards to try and get a better one."
    end

    def title_4(st)
      title(st)
      st.frame = { below_prev: 10 }
      st.text = "Round 3 (The Turn)"
    end

    def rules_4(st)
      rules(st)
      st.frame = { below_prev: 5, h: 63 }
      st.text = "A fourth card is dealt to the table, you have the option of discarding any one of your cards again."
    end

    def title_5(st)
      title(st)
      st.frame = { below_prev: 10 }
      st.text = "Round 4 (The River)"
    end

    def rules_5(st)
      rules(st)
      st.frame = { below_prev: 5, h: 105 }
      st.text = "The fifth and final card is dealt to the table, now all cards are out, you only have the option to burn (discard both cards together), or play with the cards you have."
    end

    def title_6(st)
      title(st)
      st.frame = { below_prev: 10 }
      st.text = "Folding"
    end

    def rules_6(st)
      rules(st)
      st.frame = { below_prev: 5, h: 63 }
      st.text = "You can use the fold option at anytime, a new hand will be dealt, but you will lose half your cash."
    end

    def title_7(st)
      title(st)
      st.frame = { below_prev: 10 }
      st.text = "Rebuys"
    end

    def rules_7(st)
      rules(st)
      st.frame = { below_prev: 5, h: 147 }
      st.text = "A Rebuy will be awarded at $1,024, if you lose from this point on, you will automatically rebuy back in at that value. You will also be awarded a rebuy for a Straight Flush and Royal Flush for the cash value you have at the time of getting the hand."
    end

  end
end
