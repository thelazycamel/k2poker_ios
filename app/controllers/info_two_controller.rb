class InfoTwoController < UIViewController

  def viewDidLoad
    super
    rmq.stylesheet = InfoStylesheet
    rmq(self.view).apply_style :root_view
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

end
