class InfoTwoController < UIViewController

  def viewDidLoad
    super
    rmq.stylesheet = InfoStylesheet
    rmq(self.view).apply_style :root_view
    show_views
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Hand Rankings", image: rmq.image.resource("hand_rankings"), tag: 2)
    self
  end

  def viewWillAppear(animated)
    super
    parentViewController.title = "Hand Rankings"
    self.navigationController.setNavigationBarHidden(false)
    animated
  end

  def show_views
    rmq.append(UILabel, :royal_flush)
    rmq.append(UILabel, :straight_flush)
    rmq.append(UILabel, :four_of_a_kind)
    rmq.append(UILabel, :full_house)
    rmq.append(UILabel, :flush)
    rmq.append(UILabel, :straight)
    rmq.append(UILabel, :three_of_a_kind)
    rmq.append(UILabel, :two_pair)
    rmq.append(UILabel, :pair)
    rmq.append(UILabel, :high_card)
    rmq.append(UILabel, :royal_flush_text)
    rmq.append(UILabel, :straight_flush_text)
    rmq.append(UILabel, :four_of_a_kind_text)
    rmq.append(UILabel, :full_house_text)
    rmq.append(UILabel, :flush_text)
    rmq.append(UILabel, :straight_text)
    rmq.append(UILabel, :three_of_a_kind_text)
    rmq.append(UILabel, :two_pair_text)
    rmq.append(UILabel, :pair_text)
    rmq.append(UILabel, :high_card_text)
  end

end
