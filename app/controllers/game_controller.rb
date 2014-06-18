class GameController < UIViewController

  include BubbleWrap::KVO
  include EventListeners
  include GamePlay

  attr_accessor :game, :quick_fire

  def initWithGame(game)
    initWithNibName(nil, bundle:nil)
    @game = game
    @quick_fire = PokerMotion::QuickFire.new(quick_fire_game_hash)
    self
  end

  def viewDidLoad
    super

    rmq.stylesheet = GameStylesheet
    rmq(self.view).apply_style :root_view

    set_up_views
    redraw_scene
    set_up_events
    set_up_observations
  end

  def set_up_views
    rmq.append(UILabel, :score)
    rmq.append(UILabel, :rebuys)
    rmq.append(UILabel, :action_text)
    rmq.append(UIButton, :info)
    rmq.append(UIButton, :settings)

    rmq.append(UIButton, :comp_card_one)
    rmq.append(UIButton, :comp_card_two)
    rmq.append(UIButton, :table_card_one)
    rmq.append(UIButton, :table_card_two)
    rmq.append(UIButton, :table_card_three)
    rmq.append(UIButton, :table_card_four)
    rmq.append(UIButton, :table_card_five)

    rmq.append(UIButton, :fold)
    rmq.append(UIButton, :play)
    rmq.append(UIButton, :card_1)
    rmq.append(UIButton, :card_2)
    rmq(:score).attr(text: formatted_score)
  end

  def set_up_observations
    observe(@game, "score") do |old_value, new_value|
      rmq(:score).attr(text: formatted_score)
      rmq(:score).animations.throb
    end
    observe(@game, "rebuys") do |old_value, new_value|
      rmq(:rebuys).style {|st| st.view.text = "Rebuys #{@game.rebuys}"}
      rmq(:rebuys).animations.throb
    end
  end

  def redraw_scene
    rmq(:card_1).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(1).card_1}_big") }
    rmq(:card_2).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(1).card_2}_big") }
    rmq(:table_card_one).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.table_cards[0]}_small") }
    rmq(:table_card_two).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.table_cards[1]}_small") }
    rmq(:table_card_three).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.table_cards[2]}_small") }
    rmq(:table_card_four).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.table_cards[3]}_small") }
    rmq(:table_card_five).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.table_cards[4]}_small") }
    rmq(:action_text).style do |st|
      st.view.text = [rank_text,discard_text].compact.join(" - ")
    end
    if @quick_fire.game_status == :finished
      rmq(:comp_card_one).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(2).card_1}_small") }
      rmq(:comp_card_two).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(2).card_2}_small") }
    else
      rmq(:comp_card_one).style {|st| st.background_image = rmq.image.resource("card_back") }
      rmq(:comp_card_two).style {|st| st.background_image = rmq.image.resource("card_back") }
    end
    save_game
  end

  def rank_text
    if @quick_fire.game_status == :finished && @quick_fire.to_hash[:winner][:id] == 2
      return "#{@quick_fire.player(2).rank} beats #{@quick_fire.player(1).rank}"
    else
      return @quick_fire.player(1).rank
    end
  end

  def discard_text
    return nil if @quick_fire.player(1).status == :discarded
    if @quick_fire.game_status == :river
      "Burn?"
    elsif @quick_fire.game_status == :deal || @quick_fire.game_status == :flop || @quick_fire.game_status == :turn
      return "Discard One?"
    elsif @quick_fire.game_status == :finished
      return "You Win" if @quick_fire.to_hash[:winner][:id] == 1
      return "You Lose" if @quick_fire.to_hash[:winner][:id] == 2
      return "Draw" if @quick_fire.to_hash[:draw] == true
    end
  end

  def formatted_score
    rmq.format.number(@game.score, "$###,###,###,###,###,##0")
  end

  #these two methods are needed to save and load games from NSUserDefaults

  def save_game
    @game.table_cards = @quick_fire.table_cards.join(",")
    @game.deck = @quick_fire.deck.join(",")
    @game.game_status = @quick_fire.game_status
    @game.player_1_status = @quick_fire.player(1).status
    @game.player_1_card_1 = @quick_fire.player(1).card_1
    @game.player_1_card_2 = @quick_fire.player(1).card_2
    @game.player_2_status = @quick_fire.player(2).status
    @game.player_2_card_1 = @quick_fire.player(2).card_1
    @game.player_2_card_2 = @quick_fire.player(2).card_2
    @game.save
  end

  def quick_fire_game_hash
    return {} unless required_attributes_present
    Hash.new.tap do |qf|
      qf[:table_cards] = @game.table_cards.split(",") if @game.table_cards
      qf[:deck] = @game.deck.split(",") if @game.deck
      qf[:game_status] = @game.game_status if @game.game_status
      qf[:players] = []
      qf[:players] << {id: 1, status: @game.player_1_status, card_1: @game.player_1_card_1, card_2: @game.player_1_card_2}
      qf[:players] << {id: 2, status: @game.player_2_status, card_1: @game.player_2_card_1, card_2: @game.player_2_card_2}
    end
  end

  def required_attributes_present
    @game.table_cards && @game.deck && @game.game_status
  end

end
