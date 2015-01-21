# FVCustomAlertView

[![CI Status](http://img.shields.io/travis/Francis Visoiu Mistrih/FVCustomAlertView.svg?style=flat)](https://travis-ci.org/Francis Visoiu Mistrih/FVCustomAlertView)
[![Version](https://img.shields.io/cocoapods/v/FVCustomAlertView.svg?style=flat)](http://cocoadocs.org/docsets/FVCustomAlertView)
[![License](https://img.shields.io/cocoapods/l/FVCustomAlertView.svg?style=flat)](http://cocoadocs.org/docsets/FVCustomAlertView)
[![Platform](https://img.shields.io/cocoapods/p/FVCustomAlertView.svg?style=flat)](http://cocoadocs.org/docsets/FVCustomAlertView)

Custom AlertView for iOS SDK.

[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva0_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva0.png)


[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva1_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva1.png)

## Usage

To run the example project, clone the repo, and run `pod install` from the FVCustomAlertView-Example directory first.

## Requirements

* iOS8+ project
* ARC project

## How to install FVCustomAlertView

### CocoaPods
FVCustomAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "FVCustomAlertView"

### Use FVCustomAlertView as a static library
Drag the .xcodeproj file into your XCode project and add it as a Target in your Build Phases. Don't forget to add libFVCustomAlertView.a in Link Binary With Library and set the -ObjC flag in Other Linker Flags.

### Manually add the files to your project

Add the following files and folders to your iOS project.

* FVCustomAlertView.h
* FVCustomAlertView.m
* FVCustomAlertViewResources/

## How to use FVCustomAlertView

FVCustomAlertView comes with 4 default modes and a cutom mode.
The default modes are : (make sure you try them in the example app)

* Loading

[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva1_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva1.png)
```objective-c
[FVCustomAlertView showDefaultLoadingAlertOnView:self.view withTitle:@"Loading..." withBlur:YES];
```

* Done

[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva2_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva2.png)
```objective-c
[FVCustomAlertView showDefaultDoneAlertOnView:self.view withTitle:@"Done" withBlur:YES];
```

* Error

[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva3_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva3.png)
```objective-c
[FVCustomAlertView showDefaultErrorAlertOnView:self.view withTitle:@"Error" withBlur:YES];
```

* Warning

[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva4_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva4.png)
```objective-c
[FVCustomAlertView showDefaultWarningAlertOnView:self.view withTitle:@"Be careful" withBlur:YES];
```

* Custom

[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva5_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva5.png)

[![](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva6_th.png)](https://raw.githubusercontent.com/thegameg/FVCustomAlertView/master/Screenshots/fva6.png)
```objective-c
UIView *sw = [[UISwitch alloc] init];
[FVCustomAlertView showAlertOnView:self.view withTitle:@"Do you want to recieve notifications from us?"titleColor:[UIColor whiteColor] width:120 height:140 blur:YES backgroundImage:nil backgroundColor:[UIColor blackColor] cornerRadius:20 shadowAlpha:0.2 alpha:0.8 contentView:sw type:FVAlertTypeCustom];
```

#### v.0.2
###### Current view
The current view can be retrieved using the method
```objective-c
+ (UIView *)currentView;
```

#### v.0.3
Added blur option, using `UIBlurEffect`. *iOS8+ only*.

## Author

Francis Visoiu Mistrih
http://francisvm.com/

thegameg1@yahoo.com

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).
