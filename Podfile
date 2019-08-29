platform :ios, '10.0'
use_frameworks!

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
        end
    end
end


target 'MyAppDemo' do
    pod 'MBProgressHUD'
    pod 'MJExtension','~> 3.0.13'
    pod 'ReactiveObjC'
    pod 'IQKeyboardManager'
    pod 'SDWebImage'
    pod 'Masonry'
    #字符串滚动控件
    pod 'LMJVerticalScrollText'
   

end


