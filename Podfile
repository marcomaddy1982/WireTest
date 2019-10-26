source 'https://github.com/CocoaPods/Specs.git'

project 'WireTest.xcodeproj'

platform :ios, '10.0'
use_frameworks!
inhibit_all_warnings!

def app_pods
	pod 'Reusable'
	pod 'Nuke'
  pod 'Networking', :git => 'https://github.com/marcomaddy1982/Networking.git', :branch => 'Wire'
end

def tests_pods
	pod 'Quick'
	pod 'Nimble'
end

target 'WireTest' do
    app_pods
end

target 'WireTestTests' do
    tests_pods
end

post_install do | installer |
	# Disable Bitcode
	installer.pods_project.targets.each do |target|
		target.build_configurations.each do |config|
			config.build_settings['ENABLE_BITCODE'] = 'NO'
		end
	end
end
