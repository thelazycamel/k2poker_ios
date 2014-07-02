class InfoOneController < UIViewController

  include GameHelper

  def viewDidLoad
    super
    rmq.stylesheet = InfoStylesheet
    rmq(self.view).apply_style :root_view
    @game = Game.load
    show_scores
    set_up_event_listeners
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Score", image: rmq.image.resource("score"), tag: 1)
    self
  end

  def viewWillAppear(animated)
    super
    self.navigationController.setNavigationBarHidden(false)
    parentViewController.title = "Score"
    animated
  end

  def show_scores
    score_grid
  end

  def formatted_rebuys
    @game.rebuys.map {|rebuy| formatted_score(rebuy)}.join(", ")
  end

  def score_grid
    if @game.score <= 1048576
      top_number = 1048576
    else
      top_number = @game.score * 2 * 2 * 2 * 2 * 2
    end
    21.times do |line|
      text = formatted_score(top_number)
      text += " (r)" if @game.rebuys.include?(top_number)
      rmq.append(UILabel, "score_#{line}".to_sym).style do |st|
        st.text = text
        st.color = rmq.color.white if top_number == @game.score
      end
      top_number = top_number / 2
    end
  end

  def set_up_event_listeners
    rmq(self.view).on(:swipe_left) do |sender|
      puts "loading info page 2"
    end
  end

end
