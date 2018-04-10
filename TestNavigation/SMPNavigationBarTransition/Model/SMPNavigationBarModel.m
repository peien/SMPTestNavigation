//
//  SMPNavigationBarModel.m
//  TestNavigation
//
//  Created by KaiChe on 2018/4/4.
//  Copyright © 2018年 KaiChe. All rights reserved.
//

#import "SMPNavigationBarModel.h"

@implementation SMPNavigationBarModel

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.navBarTintColor = [UIColor colorWithWhite:1 alpha:.5];
//    self.navBarImageBgColor = [UIColor lightGrayColor];
//    self.showNavBarShadow = YES;
    return self;
}

@end
