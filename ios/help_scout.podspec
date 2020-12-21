#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint help_scout.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.static_framework = true

  s.name             = 'help_scout'
  s.version          = '0.0.1'
  s.summary          = 'Help scout mobile SDK flutter implementation'
  s.description      = <<-DESC
Help scout mobile SDK flutter implementation
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Jehonadab' => 'jehonadabokpus@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Beacon'
  s.platform = :ios, '11.0'
  s.preserve_paths = 'Beacon.framework'
      s.xcconfig = { 'OTHER_LDFLAGS' => '-framework Beacon' }
      s.vendored_frameworks = 'Beacon.framework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

end
