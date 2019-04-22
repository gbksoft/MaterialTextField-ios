Pod::Spec.new do |spec|

  spec.name               = "GBKTextField"
  spec.version            = "0.1"
  spec.summary            = "Text field that allows displaying custom or using default error."
  spec.license               = 'MIT'
  spec.homepage              = 'https://gbksoft.com/'
  spec.authors               = 'Dmitry Popravka'
  spec.source                = {:git => 'git@github.com:gbksoft/MaterialTextField-ios.git', :tag => spec.version }
  spec.ios.deployment_target = '9.0'
  spec.source_files          = 'GBKDevInfoMode/GBKTextField/**/*.swift'

end
