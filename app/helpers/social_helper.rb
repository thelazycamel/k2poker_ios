module SocialHelper

  include MotionSocial::Sharing

  def sharing_message
    "I just achieved #{formatted_score(@game.score)} with '#{@quick_fire.player(1).rank}' on K2, get it at the AppStore now, via @k2_app_official"
  end

  def sharing_url
    "https://www.facebook.com/k2app"
  end

  def sharing_image
    nil
  end

  def controller
    self
  end

end
