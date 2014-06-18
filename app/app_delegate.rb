class AppDelegate
  attr_reader :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @game = Game.load
    @game ||= Game.new(score: 1, open: true, rebuys: 0, high_score: 1)
    @game_controller = GameController.alloc.initWithGame(@game)
    @window.rootViewController = @game_controller
    @window.makeKeyAndVisible
    true
  end

  def applicationDidEnterBackground(application)
    @game.save
  end

end
