Pod::Spec.new do |spec|

  spec.name                  = 'GBKTextField'
  spec.version               = '0.3.1'
  spec.summary               = 'Text field that allows displaying custom or using default error.'
  spec.license               = 'MIT'
  spec.homepage              = 'https://gbksoft.com/'
  spec.authors               = { 'GBKSoft' => 'dev@gbksoft.com' }
  spec.source                = {:git => 'https://github.com/gbksoft/MaterialTextField-ios.git', :tag => spec.version }
  spec.ios.deployment_target = '9.0'
  spec.source_files          = 'GBKTextField/GBKTextField/**/*.swift'
  spec.swift_version         = '5.0'

end
