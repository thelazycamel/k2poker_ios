class InfoThreeController < UIViewController

  include StylesheetSwitcher

  def viewDidLoad
    super
    self.title = "Rules"
    rmq.stylesheet = stylesheet_for("Info")
    rmq(self.view).apply_style :root_view
    show_rules
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

  def show_rules
    @scrollarea = rmq(self.view).append(UIScrollView, :scroll_area).get
    if rmq.device.four_inch?
      @scrollarea.frame = CGRectMake(0,70, 320, 450)
    else
      @scrollarea.frame = CGRectMake(0,70, 320, 400)
    end
    @scrollarea.scrollEnabled = true
    @scrollarea.contentSize = CGSizeMake(@scrollarea.frame.size.width, 950)
    @scrollarea.showsHorizontalScrollIndicator = false
    @scrollarea.showsVerticalScrollIndicator = true
    rmq(:scroll_area).append(UILabel, :title_1)
    rmq(:scroll_area).append(UILabel, :rules_1)
    rmq(:scroll_area).append(UILabel, :title_2)
    rmq(:scroll_area).append(UILabel, :rules_2)
    rmq(:scroll_area).append(UILabel, :title_3)
    rmq(:scroll_area).append(UILabel, :rules_3)
    rmq(:scroll_area).append(UILabel, :title_4)
    rmq(:scroll_area).append(UILabel, :rules_4)
    rmq(:scroll_area).append(UILabel, :title_5)
    rmq(:scroll_area).append(UILabel, :rules_5)
    rmq(:scroll_area).append(UILabel, :title_6)
    rmq(:scroll_area).append(UILabel, :rules_6)
    rmq(:scroll_area).append(UILabel, :title_7)
    rmq(:scroll_area).append(UILabel, :rules_7)
  end

end
