class SettingsController < Formotion::FormController

  include StylesheetSwitcher

  def viewDidLoad
    super

    self.title = "Settings"
    rmq.stylesheet = stylesheet_for("Settings")
    rmq(self.view).apply_style :root_view
  end

  def viewWillAppear(animated)
    super
    self.navigationController.setNavigationBarHidden(false)
    animated
  end

  def viewWillDisappear(animated)
    super
    values = self.form.render
    @game.sounds = values[:sounds] unless values[:sounds].nil?
    @game.difficulty = values[:difficulty] unless values[:difficulty].nil?
    animated
  end

  def inject_game(game)
    @game = game
  end

  def self.initialize_form(opts={})
    form = Formotion::Form.new
    form.build_section do |section|
      section.title = "Settings"

      section.build_row do |row|
        row.title = "Sounds"
        row.type = :switch
        row.key = :sounds
        row.value = opts[:sounds]
      end
    end
    form.build_section do |section|
      section.title = "Level"
      section.key = :difficulty
      section.select_one = true
      section.build_row do |row|
        row.title = "Easy"
        row.key = 0
        row.value = true if opts[:difficulty] == 0
        row.type = :check
      end
      section.build_row do |row|
        row.title = "Normal"
        row.key = 1
        row.value = true if opts[:difficulty] == 1
        row.type = :check
      end
      section.build_row do |row|
        row.title = "Difficult"
        row.value = true if opts[:difficulty] == 2
        row.key = 2
        row.type = :check
      end
    end
    form
  end

end
