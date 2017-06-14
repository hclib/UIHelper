Pod::Spec.new do |s|
  s.name         = "UIHelper"
  s.version      = "0.0.6"
  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'
  s.summary      = "A convenient tool for you to debug UI"
  s.homepage     = "https://github.com/hclib/UIHelper"
  s.license      = "MIT"
  s.author             = { "suhc" => "hongchengplus@163.com" }
  s.social_media_url   = "http://shc.oschina.io/"
  s.source       = { :git => "https://github.com/hclib/UIHelper.git", :tag => s.version }
  s.source_files  = "UIHelper", "UIHelper/**/*.{h,m}"
  s.resource     = 'UIHelper/Resources/UIHelper.bundle'
  s.platform     = :ios
  s.framework  = "UIKit"
  s.requires_arc = true
end
