Pod::Spec.new do |s|

s.name         = "SecondFrameworkSample"
s.version      = "1.0.0"
s.summary      = "A three-ring control like the Activity status bars"
s.description  = "The three-ring is a completely customizable widget that can be used in any iOS app. It also plays a little victory fanfare."
s.homepage     = "http://raywenderlich.com"
  s.license      = "MIT"
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/RakeshTatekonda609/SecondFrameworkSample.git", :tag => "1.0.0" }
  s.author       = "Raywenderlich.com Tutorial Team"
  s.source_files = "SecondFrameworkSample", "SecondFrameworkSample/**/*.{h,m,swift, storyboard}"
s.resource_bundles = {"SecondFrameworkSample", "SecondFrameworkSample/**/*.{storyboard}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end

