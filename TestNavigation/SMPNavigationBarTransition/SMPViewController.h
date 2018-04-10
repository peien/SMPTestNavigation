//
//  SMPViewController.h
//  TestNavigation
//
//  Created by KaiChe on 2018/4/4.
//  Copyright © 2018年 KaiChe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMPNavigationBarModel.h"

@interface SMPViewController : UIViewController

//@property (nonatomic, readonly, strong) SMPNavigationBarModel *barModel;
@property (nonatomic, strong) UIColor *navBgColor;
@property (nonatomic, assign) BOOL hiddenNavBg;
@property (nonatomic, readonly, assign) BOOL isSpecialNavBg;

@end
