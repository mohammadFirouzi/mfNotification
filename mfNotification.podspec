#
# Be sure to run `pod lib lint mfNotification.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'mfNotification'
  s.version          = '1.0.4'
  s.summary          = 'InApp notification banner.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
mfNotification is an in-app notification view that allows you to easily display notification anywhere on your app.
                       DESC

  s.homepage         = 'https://github.com/MohammadFirouzi/mfNotification'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohammad Firouzi' => 'mohammad.spz@icloud.com' }
  s.source           = { :git => 'https://github.com/MohammadFirouzi/mfNotification.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'Files/Classes/**/*'
  
  # s.resource_bundles = {
  #   'mfNotification' => ['mfNotification/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation', 'AudioToolbox'
  # s.dependency 'AFNetworking', '~> 2.3'
end
