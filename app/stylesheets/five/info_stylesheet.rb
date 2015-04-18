module Five

  class InfoStylesheet < Base::InfoStylesheet

    def score_0(st)
      super
      st.frame = {t: 75, h: 34}
      st.font = rmq.font.with_name("Helvetica Neue", 35)
    end

    def score_1(st)
      super
      st.frame = {h: 32.5}
      st.font = rmq.font.with_name("Helvetica Neue", 32.5)
    end

    def score_2(st)
      super
      st.frame = {h: 31}
      st.font = rmq.font.with_name("Helvetica Neue", 31)
    end

    def score_3(st)
      super
      st.frame = {h: 29.5}
      st.font = rmq.font.with_name("Helvetica Neue", 29.5)
    end

    def score_4(st)
      super
      st.frame = {h: 28}
      st.font = rmq.font.with_name("Helvetica Neue", 28)
    end

    def score_5(st)
      super
      st.frame = {h: 26.5}
      st.font = rmq.font.with_name("Helvetica Neue", 26.5)
    end

    def score_6(st)
      super
      st.frame = {h: 25}
      st.font = rmq.font.with_name("Helvetica Neue", 25)
    end

    def score_7(st)
      super
      st.frame = {h: 23.5}
      st.font = rmq.font.with_name("Helvetica Neue", 23.5)
    end

    def score_8(st)
      super
      st.frame = {h: 22}
      st.font = rmq.font.with_name("Helvetica Neue", 22)
    end

    def score_9(st)
      super
      st.frame = {h: 20.5}
      st.font = rmq.font.with_name("Helvetica Neue", 20.5)
    end

    def score_10(st)
      super
      st.frame = {h: 19}
      st.font = rmq.font.with_name("Helvetica Neue", 19)
    end

    def score_11(st)
      super
      st.frame = {h: 17.5}
      st.font = rmq.font.with_name("Helvetica Neue", 17.5)
    end

    def score_12(st)
      super
      st.frame = {h: 16}
      st.font = rmq.font.with_name("Helvetica Neue", 16)
    end

    def score_13(st)
      super
      st.frame = {h: 14.5}
      st.font = rmq.font.with_name("Helvetica Neue", 14.5)
    end

    def score_14(st)
      super
      st.frame = {h: 13}
      st.font = rmq.font.with_name("Helvetica Neue", 13)
    end

    def score_15(st)
      super
      st.frame = {h: 11.5}
      st.font = rmq.font.with_name("Helvetica Neue", 11.5)
    end

    def score_16(st)
      super
      st.frame = {h: 10}
      st.font = rmq.font.with_name("Helvetica Neue", 10)
    end

    def score_17(st)
      super
      st.frame = {h: 8.5}
      st.font = rmq.font.with_name("Helvetica Neue", 8.5)
    end

    def score_18(st)
      super
      st.frame = {h: 7}
      st.font = rmq.font.with_name("Helvetica Neue", 7)
    end

    def score_19(st)
      super
      st.frame = {h: 5.5}
      st.font = rmq.font.with_name("Helvetica Neue", 5.5)
    end

    def score_20(st)
      super
      st.frame = {h: 4}
      st.font = rmq.font.with_name("Helvetica Neue", 4)
    end

    def high_score(st)
      super
      st.frame = {t: 480}
    end

    def royal_flush(st)
      super
      st.frame = {t: 85}
    end

    def straight_flush(st)
      super
      st.frame = { below_prev: 7 }
    end

    def four_of_a_kind(st)
      super
      st.frame = { below_prev: 7 }
    end

    def full_house(st)
      super
      st.frame = { below_prev: 7 }
    end

    def flush(st)
      super
      st.frame = { below_prev: 7 }
    end

    def straight(st)
      super
      st.frame = { below_prev: 7 }
    end

    def three_of_a_kind(st)
      super
      st.frame = { below_prev: 7 }
    end

    def two_pair(st)
      super
      st.frame = { below_prev: 7 }
    end

    def pair(st)
      super
      st.frame = { below_prev: 7 }
    end

    def high_card(st)
      super
      st.frame = { below_prev: 7 }
    end

    def royal_flush_text(st)
      super
      st.frame = {t: 90}
    end

    def straight_flush_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def four_of_a_kind_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def full_house_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def flush_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def straight_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def three_of_a_kind_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def two_pair_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def pair_text(st)
      super
      st.frame = { below_prev: 17 }
    end

    def high_card_text(st)
      super
      st.frame = { below_prev: 17 }
    end

  end

end
