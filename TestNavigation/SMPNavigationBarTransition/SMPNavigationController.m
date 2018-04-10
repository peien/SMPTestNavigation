//
//  SMPNavigationController.m
//  TestNavigation
//
//  Created by KaiChe on 2018/4/4.
//  Copyright © 2018年 KaiChe. All rights reserved.
//


#import "SMPNavigationController.h"
#import "Masonry.h"
#import "SMPViewController.h"

@interface SMPNavigationController ()

@property (nonatomic, strong) UIView *bgContentView;
@end

@implementation SMPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self navBarAddBg];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navBarAddBg {
    [self.navigationBar addSubview:self.navBarBgEffectView];
    [self.navigationBar sendSubviewToBack:self.navBarBgEffectView];
    [self.navBarBgEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.navigationBar);
        make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
    }];
}

#pragma mark - getter
- (UIVisualEffectView *)navBarBgEffectView {
    if (!_navBarBgEffectView) {
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *efftectView = [[UIVisualEffectView alloc] initWithEffect:blur];
//        efftectView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, WD_HEIGHT_NAV_BAR);
        
        [efftectView.contentView addSubview:self.bgContentView];
        [self.bgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(efftectView);
        }];
        _navBarBgEffectView = efftectView;
    }
    return _navBarBgEffectView;
}

- (UIView *)bgContentView {
    if (!_bgContentView) {
        _bgContentView = [[UIView alloc] init];
        _bgContentView.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
    }
    return _bgContentView;
}

- (BOOL)needAddFakerNav {
     NSInteger vcCount = self.viewControllers.count;
    NSLog(@"vCount:%@", @(vcCount));
    if (self.viewControllers.count < 2) {
        return NO;
    }
   
    SMPViewController *lastVC = self.viewControllers.lastObject;
    SMPViewController *lastPreVC = self.viewControllers[vcCount - 2];
    if (!lastVC.isSpecialNavBg && !lastPreVC.isSpecialNavBg) {
        return NO;
    }
    return YES;
}

@end
