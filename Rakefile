# -*- coding: utf-8 -*-
$:.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'
require 'bundler'
require 'formotion'
require 'poker_motion'
require 'ruby-poker'
require 'bubble-wrap/media'

Bundler.require

Motion::Project::App.setup do |app|

  app.name = 'K2 Poker'
  app.identifier = 'com.k2app.net.k2poker'
  app.short_version = '1.4'
  app.version = app.short_version
  app.release do
    app.provisioning_profile = "/Users/stuart/Library/MobileDevice/Provisioning\ Profiles/b4f4baad-bf3a-45f3-a815-d38a31005b48.mobileprovision"
  end

  app.sdk_version = '8.4'
  app.deployment_target = '8.4'

  app.icons = ["icon@2x.png", "icon-29@2x.png", "icon-40@2x.png", "icon-60@2x.png", "icon-76@2x.png", "icon-512@2x.png"]

  # prerendered_icon is only needed in iOS 6
  #app.prerendered_icon = true

  app.device_family = [:iphone]
  app.interface_orientations = [:portrait, :portrait_upside_down]

  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))

  # Use `rake config' to see complete project settings, here are some examples:
  #
  # app.fonts = ['Oswald-Regular.ttf', 'FontAwesome.otf'] # These go in /resources
  # app.frameworks += %w(QuartzCore CoreGraphics MediaPlayer MessageUI CoreData)
  app.frameworks += ['MediaPlayer',"Social", "Accounts","AdSupport","SystemConfiguration","CoreMotion","StoreKit"]
  app.vendor_project('vendor/leadbolt', :static)
  # app.vendor_project('vendor/DSLCalendarView', :static, :cflags => '-fobjc-arc') # Using arc
  #
  # app.pods do
  #   pod 'AFNetworking'
  #   pod 'SVPrograssHUD'
  #   pod 'JMImageCache'
  # end
 
end
