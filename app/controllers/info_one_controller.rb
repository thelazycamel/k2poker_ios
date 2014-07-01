class InfoOneController < UIViewController

  def viewDidLoad
    super

    self.title = "Score"
    rmq.stylesheet = InfoStylesheet
    rmq(self.view).apply_style :root_view
  end

  def viewWillAppear(animated)
    super
    self.navigationController.setNavigationBarHidden(false)
    animated
  end

end
