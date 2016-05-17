Pod::Spec.new do |s|
  s.name                  = "SwpNetworking"
  s.version               = "1.0.3"
  s.ios.deployment_target = '7.0'
  s.summary               = " AFNetworking 封装 "
  s.homepage              = "https://github.com/swp-song/SwpNetworking"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpNetworking.git", :tag => s.version }
  s.source_files          = "SwpNetworking"
  s.requires_arc          = true
  s.dependency "AFNetworking"
end