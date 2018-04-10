//
//  SMPNavigationController.h
//  TestNavigation
//
//  Created by KaiChe on 2018/4/4.
//  Copyright © 2018年 KaiChe. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IS_IPHONEX   ([UIScreen mainScreen].bounds.size.height == 812.0)
#define WD_HEIGHT_NAV_BAR (IS_IPHONEX ? 88 : ((floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)?44:64))


@interface SMPNavigationController : UINavigationController


@property (nonatomic, strong) UIVisualEffectView *navBarBgEffectView;
- (BOOL)needAddFakerNav;

@end
