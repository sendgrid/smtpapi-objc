Pod::Spec.new do |s|
  s.name             = "SMTPAPI"
  s.version          = "0.1.0"
  s.summary          = "Simple Wrapper around SendGrid SMTPAPI Header"
  s.description      = <<-DESC
                       This module will let you build SendGrid's SMTP API headers with simplicity.
                       DESC
  s.homepage         = "https://github.com/heitortsergent/smtpapi-ios"
  s.license          = 'MIT'
  s.author           = { "Heitor Tashiro Sergent" => "heitortsergent@gmail.com" }
  s.source           = { :git => "https://github.com/heitortsergent/smtpapi-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/heitortsergent'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
end
