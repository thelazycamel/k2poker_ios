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

  app.name = 'K2poker'
  app.identifier = '912153432'
  app.short_version = '1.0.0'
  app.version = app.short_version
  app.provisioning_profile = "/Users/stuart/Library/MobileDevice/Provisioning\ Profiles/a6cecd9e-112e-4bc8-b787-f46a6a4ab9d5.mobileprovision"

  app.sdk_version = '7.1'
  app.deployment_target = '7.0'
  # Or for iOS 6
  #app.sdk_version = '6.1'
  #app.deployment_target = '6.0'

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
  app.frameworks += ['MediaPlayer',"Social", "Accounts"]
  # app.vendor_project('vendor/Flurry', :static)
  # app.vendor_project('vendor/DSLCalendarView', :static, :cflags => '-fobjc-arc') # Using arc
  #
  # app.pods do
  #   pod 'AFNetworking'
  #   pod 'SVPrograssHUD'
  #   pod 'JMImageCache'
  # end
 
end
