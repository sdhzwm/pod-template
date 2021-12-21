#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ${POD_NAME}.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  # http://172.16.69.171/ios/iosCom/baseModule/    # 基础组件
  # http://172.16.69.171/ios/iosCom/functionModule/ # 功能组件
  # http://172.16.69.171/ios/iosCom/businessModule/ # 业务组件

  s.homepage         = 'http://172.16.69.171/ios/iosCom/baseModule/${POD_NAME}'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '${USER_NAME}' => '${USER_EMAIL}' }
  s.source           = { :git => 'http://172.16.69.171/ios/iosCom/baseModule/${POD_NAME}.git', :tag => s.version.to_s }


  s.ios.deployment_target = '10.0'
  s.swift_version  = '5.0'

  s.source_files = 'Sources', '${POD_NAME}/Classes/**/*'
  
  s.resource_bundles = {
    '${POD_NAME}' => ['${POD_NAME}/Assets/*']
  }

  # s.dependency 'CZNetworking'
  # s.dependency 'CZBaseModel'
  # s.dependency 'CZCarouselView'
  # s.dependency 'CZWebView'
  # s.dependency 'CZSimpleVideoPlayer'
  # s.dependency 'CZMediator'
  # s.dependency 'CZUIKit'
  # s.dependency 'CZToast'
  # s.dependency 'CZTools'
  # s.dependency 'ZTHUD'
  # s.dependency 'CZPhotoBrowser'
  # s.dependency 'CZPlayerManager'
  # s.dependency 'AttributedString'
  # s.dependency 'CZQuestionnaire'
  # s.dependency 'CZAppConfig'
  # s.dependency 'CZTools'
  # s.dependency 'CZExtensions'

end
