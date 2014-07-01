class InfoThreeController < UIViewController

  def viewDidLoad
    super
    self.title = "Rules"
    rmq.stylesheet = InfoStylesheet
    rmq(self.view).apply_style :root_view
  end

  def initWithNibName(name, bundle: bundle)
    super
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("Rules", image: rmq.image.resource("rules"), tag: 3)
    self
  end

  def viewWillAppear(animated)
    super
    parentViewController.title = "Rules"
    self.navigationController.setNavigationBarHidden(false)
    animated
  end

end
