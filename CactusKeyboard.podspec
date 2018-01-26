#
# Be sure to run `pod lib lint CactusKeyboard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CactusKeyboard'
  s.version          = '1.0.0'
  s.summary          = 'CactusKeyboard - simple observing of keyboard visibility.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Add just one line of code to observe keyboard visibility.
                       DESC

  s.homepage         = 'https://github.com/Maxim Vialykh/CactusKeyboard'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxim Vialykh' => 'maxim.vialykh@cactussoft.biz' }
  s.source           = { :git => 'https://github.com/Maxim Vialykh/CactusKeyboard.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Umaks_vs'

  s.ios.deployment_target = '10.0'

  s.source_files = 'CactusKeyboard/Classes/**/*'

end
