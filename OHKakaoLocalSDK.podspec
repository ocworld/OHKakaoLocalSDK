#
# Be sure to run `pod lib lint OHKakaoLocalSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OHKakaoLocalSDK'
  s.version          = '0.1.1'
  s.summary          = 'iOS Swift SDK for Kakao Rest API - Local'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iOS Swift SDK for Kakao Rest API

Support API
- Coord2Address
- Coord2RegionCode
- SearchAddress
- GeoTranscoord

Reference
https://developers.kakao.com/docs/restapi/local

                       DESC

  s.homepage         = 'https://github.com/ocworld/OHKakaoLocalSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ocworld' => 'ocworld@gmail.com' }
  s.source           = { :git => 'https://github.com/ocworld/OHKakaoLocalSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.1'

  s.source_files = 'OHKakaoLocalSDK/Sources/**/*'
  
  s.resources = 'OHKakaoLocalSDK/Assets/*.plist'
  
  # s.resource_bundles = {
  #   'OHKakaoLocalSDK' => ['OHKakaoLocalSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~> 4.7'
end
