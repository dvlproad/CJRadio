Pod::Spec.new do |s|
  s.name         = "CJRadio"
  s.version      = "1.0.3"
  s.summary      = "单选按钮的组合CJRadioButtons、CJRadioComposeView、由RadioButtons和RadioComposeView再组合使用的CJButtonControllerView"
  s.homepage     = "https://github.com/dvlproad/CJRadio"
  s.license      = "MIT"
  s.author             = "dvlproad"
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CJRadio.git", :tag => "CJRadio_1.0.3" }
  s.source_files  = "CJRadio/*.{h,m}"
  # s.resources = "CJRadio/*.{png,xib}"
  s.frameworks = 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  #s.subspec 'CJButtonControllerView' do |ss|
  #  ss.source_files = "CJRadio/CJButtonControllerView/**/*.{h,m}"
  #end

  s.subspec 'CJRadioButtons' do |ss|
    ss.source_files = "CJRadio/CJRadioButtons/**/*.{h,m}"
    ss.resources = "CJRadio/CJRadioButtons/**/*.{png,xib}"

    ss.dependency 'CJPopupAction', '~> 1.4.2'
  end

  s.subspec 'CJRadioComposeView' do |ss|
    ss.source_files = "CJRadio/CJRadioComposeView/**/*.{h,m}"
  end

end
