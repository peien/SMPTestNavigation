//
//  SMPNavigationBarModel.h
//  TestNavigation
//
//  Created by KaiChe on 2018/4/4.
//  Copyright © 2018年 KaiChe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SMPNavigationBarModel : NSObject

//navBar 的背景色
@property (nonatomic, strong) UIColor *navBarTintColor;

//确认隐藏 navBar,默认 NO, 如果 YES:将看不到导航栏和上面的按钮, 其他的属性就没有意义了。
//@property (nonatomic, assign) BOOL realHiddenNavBar;
//废弃
//@property (nonatomic, strong) UIColor *navBarImageBgColor;

//是否显示导航栏下面的线，默认显示
//@property (nonatomic, assign) BOOL showNavBarShadow;

//@property (nonatomic, assign) BOOL clearNavBarBgColor;


@end
