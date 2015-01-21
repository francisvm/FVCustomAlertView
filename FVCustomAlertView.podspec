Pod::Spec.new do |s|
  s.name         = "FVCustomAlertView"
  s.version      = "0.3"
  s.summary      = "An iOS custom alert view."
  s.description  = <<-DESC
                    FVCustomAlertView can display a custom alert, meant to replace the UIAlertView.
                    DESC
  s.homepage     = "https://github.com/thegameg/FVCustomAlertView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Francis Visoiu Mistrih' => 'thegameg1@yahoo.com' }
  s.source           = { :git => "https://github.com/thegameg/FVCustomAlertView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/thegameg'

  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.frameworks = "Foundation", "UIKit"

  s.source_files = 'FVCustomAlertView/FVCustomAlertView/*.{h,m}'
  s.public_header_files = 'FVCustomAlertView', 'FVCustomAlertView/**/*.h'
  s.resources = "FVCustomAlertView/FVCustomAlertViewResources/*.png"
end

