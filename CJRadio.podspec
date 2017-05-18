Pod::Spec.new do |s|
  s.name         = "CJRadio"
  s.version      = "1.0.5"
  s.summary      = "单选按钮、单选视图"
  s.description  = <<-DESC
                  *、CJRadioButtons：单选按钮组合
                  *、CJCycleComposeView：一个可以无限循环的视图组合类
                  *、CJRadioButtonCycleComposeView：单选按钮+无限循环的视图

                   A longer description of CJPopupAction in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/dvlproad/CJRadio"
  s.license      = "MIT"
  s.author             = "dvlproad"
  # s.social_media_url   = "http://twitter.com/dvlproad"

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/dvlproad/CJRadio.git", :tag => "CJRadio_1.0.5" }
  s.source_files  = "CJRadio/*.{h,m}"
  # s.resources = "CJRadio/*.{png,xib}"
  s.frameworks = 'UIKit'

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

  s.subspec 'CJRadioButtons' do |ss|
    ss.source_files = "CJRadio/CJRadioButtons/**/*.{h,m}"
    ss.resources = "CJRadio/CJRadioButtons/**/*.{png,xib}"

    ss.dependency 'CJPopupAction', '~> 1.4.2'
  end

  # 一个可以无限循环的视图组合类
  s.subspec 'CJCycleComposeView' do |ss|
    ss.source_files = "CJRadio/CJCycleComposeView/**/*.{h,m}"
  end

  s.subspec 'CJRadioButtonCycleComposeView' do |ss|
    ss.source_files = "CJRadio/CJRadioButtonCycleComposeView/**/*.{h,m}"

    ss.dependency 'CJRadio/CJRadioButtons'
    ss.dependency 'CJRadio/CJCycleComposeView'
  end

end
