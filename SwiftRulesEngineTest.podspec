Pod::Spec.new do |s|
  s.name             = "SwiftRulesEngineTest"
  s.version          = "1.0.0-beta.1"
  s.summary          = "SwiftRulesEngineTest"
  s.description      = <<-DESC
                      A simple, generic, extensible Rules Engine in Swift
                        DESC
  s.homepage         = "https://github.com/yangyansong-adbe/aepsdk-rulesengine-ios"
  s.license          = 'Apache V2'
  s.author       = "Adobe Experience Platform SDK Team"
  s.source           = { :git => "https://github.com/yangyansong-adbe/aepsdk-rulesengine-ios.git", :tag => s.version.to_s }

  s.requires_arc          = true

  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }

  s.swift_version = '5.0'
  s.source_files  = 'Sources/AEPRulesEngine/**/*.swift'

end
