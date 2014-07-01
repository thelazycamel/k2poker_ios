class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @game = Game.load
    @game ||= Game.new(score: 1, open: true, rebuys: [], high_score: 1)
    @controller = GameController.alloc.initWithGame(@game)
    @nav_controller = UINavigationController.alloc.initWithRootViewController(@controller)
    @window.rootViewController = @nav_controller
    @window.makeKeyAndVisible
    true
  end

  def applicationDidEnterBackground(application)
    @game.save
  end

end
