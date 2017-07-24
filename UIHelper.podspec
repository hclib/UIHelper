Pod::Spec.new do |s|
  s.name         = "UIHelper" #项目名
  s.version      = "1.0.3"    #当前版本
  s.ios.deployment_target = '6.0' #支持的最低iOS系统版本
  s.osx.deployment_target = '10.8' #支持的最低ox系统版本
  s.summary      = "A convenient tool for you to debug UI" #项目描述
  s.homepage     = "https://github.com/hclib/UIHelper" #项目的github地址,浏览器地址栏中的内容
  s.license      = "MIT" #项目使用的许可证
  s.author             = { "suhc" => "hongchengplus@163.com" } #作者信息“作者名” => “作者邮箱”
  s.social_media_url   = "http://blog.astudyer.com/" #作者的其它联系方式，微博地址，github地址，或者是作者的博客地址等
  s.source       = { :git => "https://github.com/hclib/UIHelper.git", :tag => s.version } #项目git地址和当前Release的tag版本
  s.source_files  = "UIHelper", "UIHelper/**/*.{h,m}" #"*" 表示匹配所有文件 "*.{h,m}" 表示匹配所有以.h和.m结尾的文件 "**" 表示匹配所有子目录
  s.resource     = 'UIHelper/Resources/UIHelper.bundle' #项目的资源文件
  s.platform     = :ios #平台类型
  s.framework  = "UIKit" #声明所依赖的核心库，这里只用到了UIKit
  s.requires_arc = true #是否支持ARC
end
