class InfoFourController < UIViewController

  include StylesheetSwitcher

  def viewDidLoad
    super
    rmq.stylesheet = stylesheet_for("Info")
    rmq(self.view).apply_style :root_view
    walkthrough
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("How to Play", image: rmq.image.resource("walkthrough"), tag: 4)
    self
  end

  def viewWillAppear(animated)
    super
    self.navigationController.setNavigationBarHidden(false)
    parentViewController.title = "How to Play"
    animated
  end

  def walkthrough
    rmq.append(UIImageView, :walkthrough)
  end

end

