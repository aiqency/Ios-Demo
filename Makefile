TARGET=IosDemo.xcworkspace

$(TARGET):
	pod install
	open IosDemo.xcworkspace

clean:
	rm -rf ~/Library/Developer/Xcode/DerivedData
	rm Podfile.lock
	rm -rf Pods
	rm -rf IosDemo.xcworkspace

