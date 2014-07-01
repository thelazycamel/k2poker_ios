class InfoTwoController < UIViewController

  def viewDidLoad
    super

    self.title = "Hand Rankings"
    rmq.stylesheet = InfoStylesheet
    rmq(self.view).apply_style :root_view
  end

  def viewWillAppear(animated)
    super
    self.navigationController.setNavigationBarHidden(false)
    animated
  end

end
