# Uncomment this line to define a global platform for your project
platform :ios, '12.1'

# CocoaPods analytics sends network stats synchronously affecting flutter build latency.
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

project 'Runner', {
  'Debug' => :debug,
  'Profile' => :release,
  'Release' => :release,
}

def flutter_root
  generated_xcode_build_settings_path = File.expand_path(File.join('..', 'Flutter', 'Generated.xcconfig'), __FILE__)
  unless File.exist?(generated_xcode_build_settings_path)
    raise "#{generated_xcode_build_settings_path} must exist. If you're running pod install manually, make sure flutter pub get is executed first"
  end

  File.foreach(generated_xcode_build_settings_path) do |line|
    matches = line.match(/FLUTTER_ROOT\=(.*)/)
    return matches[1].strip if matches
  end
  raise "FLUTTER_ROOT not found in #{generated_xcode_build_settings_path}. Try deleting Generated.xcconfig, then run flutter pub get"
end

require File.expand_path(File.join('packages', 'flutter_tools', 'bin', 'podhelper'), flutter_root)

flutter_ios_podfile_setup

target 'Runner' do
  use_frameworks!
  use_modular_headers!
  
  # pod 'FolioReaderKit', :git => 'https://github.com/FolioReader/FolioReaderKit.git'
  # pod 'FolioReaderKit', :git => 'https://github.com/alexeyismirnov/FolioReaderKit.git'
  # pod 'FolioReaderKit', :git => 'https://github.com/androidseb25/FolioReaderKit.git'
  # pod 'FolioReaderKit', :git => 'https://github.com/angelfretz23/FolioReaderKit.git'

  # pod 'FolioReaderKit', :git => 'https://github.com/ricardohg/FolioReaderKit.git'
  
  
  #  pod 'FolioReaderKit', :git => 'https://github.com/HansenRepo/FolioReaderKit.git'
#  pod 'FolioReaderKit', :git => 'https://github.com/Waqar27324/Folioreaderkitios.git'
  pod 'NFolioReaderKit', :git => 'https://github.com/kaushikgodhani/bmcalisterFolioReaderKit.git'
  # pod 'FolioReaderKit', :git => 'https://github.com/Waqar27324/FolioReaderFinal.git'

  # pod 'FolioReaderKit', :git => 'https://github.com/HansenRepo/FolioReaderKit.git'

  
  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    target.build_configurations.each do |config|

      config.build_settings["ONLY_ACTIVE_ARCH"] = "YES"
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
   
      # You can remove unused permissions here
      # for more infomation: https://github.com/BaseflowIT/flutter-permission-handler/blob/master/permission_handler/ios/Classes/PermissionHandlerEnums.h
      # e.g. when you don't need camera permission, just add 'PERMISSION_CAMERA=0'
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',

        'PERMISSION_MEDIA_LIBRARY=1',

        'PERMISSION_PHOTOS=1',

        'PERMISSION_CAMERA=1',
      ]

    end      
  end
end
