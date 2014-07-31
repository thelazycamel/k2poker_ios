class GameController < UIViewController

  include GameHelper
  include SoundsHelper
  include EventListeners
  include GamePlay

  attr_accessor :game, :quick_fire

  def initWithGame(game)
    initWithNibName(nil, bundle:nil)
    load_game(game)
    self
  end

  def load_game(game)
    @game = game
    @quick_fire = PokerMotion::QuickFire.new(quick_fire_game_hash)
  end

  def viewDidLoad
    super

    rmq.stylesheet = GameStylesheet
    rmq(self.view).apply_style :root_view

    set_up_views
    redraw_scene
    set_up_events
    true
  end

  def viewWillAppear(animated)
    super
    @game ||= Game.load
    load_game(@game)
    self.navigationController.setNavigationBarHidden(true)
    animated
  end

  def viewWillDisappear(animated)
    super
    save_game
    animated
  end

  def set_up_views
    rmq.append(UILabel, :score)
    rmq.append(UILabel, :rebuys)
    rmq.append(UILabel, :action_text)
    rmq.append(UIButton, :info)
    rmq.append(UIButton, :settings)
    rmq.append(UIButton, :fold)
    rmq.append(UIButton, :play)

    rmq.append(UIButton, :comp_card_1)
    rmq.append(UIButton, :comp_card_2)
    rmq.append(UIButton, :table_card_1)
    rmq.append(UIButton, :table_card_2)
    rmq.append(UIButton, :table_card_3)
    rmq.append(UIButton, :table_card_4)
    rmq.append(UIButton, :table_card_5)

    rmq.append(UIButton, :card_1)
    rmq.append(UIButton, :card_2)

    rmq.append(UILabel, :burn_icon_1).tag(:burn_icon)
    rmq.append(UILabel, :burn_icon_2).tag(:burn_icon)

    rmq(:score).attr(text: formatted_score(@game.score))

  end

  def redraw_scene
    set_up_cards
    show_burn_options
    rmq(:score).style {|st| st.text = formatted_score(@game.score) }
    rmq(:rebuys).style {|st| st.text = "Rebuys #{@game.rebuys.size}" }
    rmq(:action_text).style { |st| st.view.text = rank_text }
    if @quick_fire.game_status == :finished
      rmq(:comp_card_1).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(2).card_1}_small") }
      rmq(:comp_card_2).style {|st| st.background_image = rmq.image.resource("#{@quick_fire.player(2).card_2}_small") }
      reveal_cards(:comp_card_1, :comp_card_2)
    else
      rmq(:comp_card_1).style {|st| st.background_image = rmq.image.resource("card_back") }
      rmq(:comp_card_2).style {|st| st.background_image = rmq.image.resource("card_back") }
    end
    save_game
  end

  def set_up_cards
    set_up_card(1, true)
    set_up_card(2, true)
    5.times do |card|
      set_up_card(card, false)
    end
  end

  def set_up_card(card_number, player)
    card = player ? "card_#{card_number}".to_sym : "table_card_#{card_number + 1}".to_sym
    card_image = player ? "#{@quick_fire.player(1).send(card)}_big" : "#{@quick_fire.table_cards[card_number]}_small"
    card_value = card_image.split("_").first
    rmq(card).clear_tags
    if card_value
      rmq(card).tag(:ranked) if @quick_fire.player(1).ranked_cards.include?(card_value)
      rmq(card).style {|st| st.background_image = rmq.image.resource(card_image) }
    else
      rmq(card).style {|st| st.background_image = rmq.image.resource("") }
    end
  end

  def show_burn_options
    if @quick_fire.player(1).status == :discarded
      rmq(:burn_icon).style {|st| st.background_image = rmq.image.resource("no_entry") }
    elsif @quick_fire.game_status == :river
      rmq(:burn_icon).style {|st| st.background_image = rmq.image.resource("discard") }
    else
      rmq(:burn_icon).style {|st| st.background_image = rmq.image.resource("empty") }
    end
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
