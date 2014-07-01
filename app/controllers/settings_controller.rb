class SettingsController < UIViewController

  def viewDidLoad
    super

    self.title = "Settings"
    rmq.stylesheet = SettingsStylesheet
    rmq(self.view).apply_style :root_view
  end

  def viewWillAppear(animated)
    super
    self.navigationController.setNavigationBarHidden(false)
    animated
  end

end
