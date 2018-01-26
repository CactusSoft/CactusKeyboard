Pod::Spec.new do |spec|
  spec.name         = 'CactusKeyboard'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/CactusSoft/CactusKeyboard'
  spec.authors      = { 'Maxim Vialykh' => 'maxim.vialykh@cactussoft.biz' }
  spec.summary      = 'CactusKeyboard - simple observing of keyboard visibility.'
  spec.source       = { :git => 'https://github.com/CactusSoft/CactusKeyboard.git', :tag => spec.version.to_s }
  spec.source_files = 'CactusKeyboard/Classes/**/*'
  spec.ios.deployment_target = '9.0'
end
