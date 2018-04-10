//
//  SMPViewController.m
//  TestNavigation
//
//  Created by KaiChe on 2018/4/4.
//  Copyright © 2018年 KaiChe. All rights reserved.
//

#import "SMPViewController.h"
#import "UIImage+ImageWithColor.h"
#import "Masonry.h"
#import "SMPNavigationController.h"

@interface SMPViewController ()

@property (nonatomic, strong) UINavigationBar *transitionNavigationBar;
@property (nonatomic, assign) BOOL hiddenNavBar;
@property (nonatomic, strong) UIView *fakerNavBar;
@property (nonatomic, strong) UIView *customNavBarBg;

@end

@implementation SMPViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) {
        return nil;
    }
//    _barModel = [[SMPNavigationBarModel alloc] init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UITableView *tableView = [[UITableView alloc] init];
//    [self.view addSubview:tableView];
//    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//    tableView.dataSource = self;
//    tableView.delegate = self;
//    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, .1)];
//    
//    UILabel *label = [[UILabel alloc] init];
//    label.backgroundColor = [UIColor greenColor];
//    label.text = @"ssdsafdassfda";
//    [tableView addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(tableView).offset(20);
//        make.top.equalTo(tableView).offset(88);
//    }];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.hiddenNavBar = YES;
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *efftectView = [[UIVisualEffectView alloc] initWithEffect:blur];
//    efftectView.frame = CGRectMake(0, -44, [UIScreen mainScreen].bounds.size.width, 88);
////    efftectView.backgroundColor = [UIColor colorWithWhite:0 alpha:.7];
//    UIView *view = [[UIView alloc] initWithFrame:efftectView.bounds];
//    view.backgroundColor = [UIColor colorWithWhite:0 alpha:.8];
//    [efftectView.contentView addSubview:view];
//    [self.navigationController.navigationBar addSubview:efftectView];
//    [self.navigationController.navigationBar sendSubviewToBack:efftectView];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//    [self addTransitionNavigationBarIfNeeded];
//    self.navigationController.navigationBar.barTintColor = self.barModel.navBarTintColor;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:self.barModel.navBarTintColor] forBarMetrics:UIBarMetricsDefault];
//    UIImage *shadowImage = self.barModel.showNavBarShadow ? nil : [[UIImage alloc] init];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//     self.navBarBgViewHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    return;
        id<UIViewControllerTransitionCoordinator> tc = self.transitionCoordinator;
    SMPViewController *toViewController = [tc viewControllerForKey:UITransitionContextToViewControllerKey];
    SMPViewController *fromViewController = [tc viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!toViewController.isSpecialNavBg && !fromViewController.isSpecialNavBg) {
        return;
    }
//    if ([self isEqual:self.navigationController.viewControllers.lastObject] && [toViewController isEqual:self]  && tc.presentationStyle == UIModalPresentationNone) {
//        NSLog(@"toViewController is self");
//    }
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
//    if (!nav.needAddFakerNav) {
//        return;
//    }
    
    [nav.navBarBgEffectView removeFromSuperview];
    [self.view addSubview:self.fakerNavBar];
    [self.fakerNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
    }];
    
//    [self addFakerNavBarIfNeeded];
//     self.navigationController.navigationBar.barTintColor = self.barModel.navBarTintColor;
//    id<UIViewControllerTransitionCoordinator> tc = self.transitionCoordinator;
//    UIViewController *toViewController = [tc viewControllerForKey:UITransitionContextToViewControllerKey];
//
//    if ([self isEqual:self.navigationController.viewControllers.lastObject] && [toViewController isEqual:self]  && tc.presentationStyle == UIModalPresentationNone) {
//        if (!self.transitionNavigationBar) {
//            [self addTransitionNavigationBarIfNeeded];
//        }
//        [self hiddenNavBar];
//    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    return;
    id<UIViewControllerTransitionCoordinator> tc = self.transitionCoordinator;
    SMPViewController *toViewController = [tc viewControllerForKey:UITransitionContextToViewControllerKey];
    SMPViewController *fromViewController = [tc viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!toViewController.isSpecialNavBg && !fromViewController.isSpecialNavBg) {
        return;
    }
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
//    if (!nav.needAddFakerNav) {
//        return;
//    }
//    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
    [self.fakerNavBar removeFromSuperview];
    [nav.navigationBar addSubview:self.customNavBarBg];
    [self.customNavBarBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(nav.navigationBar);
        make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
    }];
    [nav.navigationBar sendSubviewToBack:self.customNavBarBg];
//    [self removeFakerNavBarIfNeeded];
//    [self addCustomNavBarBgIfNeeded];
//    [self.transitionNavigationBar removeFromSuperview];
//    self.hiddenNavBar = NO;
//    self.navigationController.navigationBar.barTintColor = self.barModel.navBarTintColor;
//    if (self.transitionNavigationBar) {
//        self.navigationController.navigationBar.barTintColor = self.transitionNavigationBar.barTintColor;
//        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//        [self.navigationController.navigationBar setShadowImage:nil];
//        [self.transitionNavigationBar removeFromSuperview];
////        self.transitionNavigationBar = nil;
//    }
//    self.navBarBgViewHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    return;
    id<UIViewControllerTransitionCoordinator> tc = self.transitionCoordinator;
    SMPViewController *toViewController = [tc viewControllerForKey:UITransitionContextToViewControllerKey];
    SMPViewController *fromViewController = [tc viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!toViewController.isSpecialNavBg && !fromViewController.isSpecialNavBg) {
        return;
    }
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
//    if (!nav.needAddFakerNav) {
//        return;
//    }
//    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
    [self.customNavBarBg removeFromSuperview];
    [self.view addSubview:self.fakerNavBar];
    [self.fakerNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
    }];
//    [self addFakerNavBarIfNeeded];
//    [self addTransitionNavigationBarIfNeeded];
//    self.hiddenNavBar = YES;
    
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    return;
    id<UIViewControllerTransitionCoordinator> tc = self.transitionCoordinator;
    SMPViewController *toViewController = [tc viewControllerForKey:UITransitionContextToViewControllerKey];
    SMPViewController *fromViewController = [tc viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!toViewController.isSpecialNavBg && !fromViewController.isSpecialNavBg) {
        return;
    }
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
//    if (!nav.needAddFakerNav) {
//        return;
//    }
    [self.fakerNavBar removeFromSuperview];
//     SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
//    [nav.navigationBar addSubview:self.customNavBarBg];
//    if (nav.navigationBar) {
//        [self.customNavBarBg mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.bottom.equalTo(nav.navigationBar);
//            make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
//        }];
//        [nav.navigationBar sendSubviewToBack:self.customNavBarBg];
//    }
   
//    [self removeFakerNavBarIfNeeded];
//    [self removeCustomNavBarBgIfNeeded];
}

- (void)removeCustomNavBarBgIfNeeded {
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
//    if (nav.needAddFakerNav) {
        if (self.hiddenNavBg) {
            return;
        }
        if (self.fakerNavBar) {
            [self.fakerNavBar removeFromSuperview];
        }
        if (self.customNavBarBg) {
            [self.customNavBarBg removeFromSuperview];
        }
//    }
}

- (void)addCustomNavBarBgIfNeeded {
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
    if (nav.needAddFakerNav) {
        if (self.hiddenNavBg) {
            return;
        }
        if (self.fakerNavBar) {
            [self.fakerNavBar removeFromSuperview];
        }
        if (self.navBgColor) {
            UIView *navBgView = [[UIView alloc] init];
            navBgView.backgroundColor = self.navBgColor;
            [nav.navigationBar addSubview:navBgView];
            [navBgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.bottom.equalTo(nav.navigationBar);
                make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
            }];
            [nav.navigationBar sendSubviewToBack:navBgView];
            self.customNavBarBg = navBgView;
            return;
        }
    }
}

- (void)removeFakerNavBarIfNeeded {
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
    if (nav.needAddFakerNav) {
        if (self.hiddenNavBg) {
            return;
        }
        if (self.fakerNavBar) {
            [self.fakerNavBar removeFromSuperview];
        }
        
        if (self.navBgColor) {
            
            return;
        }
        nav.navBarBgEffectView.hidden = NO;
    }
}

- (void)addFakerNavBarIfNeeded {
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
    if (nav.needAddFakerNav) {
        nav.navBarBgEffectView.hidden = YES;
        if (self.hiddenNavBg) {
            return;
        }
        if (self.navBgColor) {
            self.fakerNavBar = [[UIView alloc] init];
            self.fakerNavBar.backgroundColor = self.navBgColor;
            [self.view addSubview:self.fakerNavBar];
            [self.fakerNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.equalTo(self.view);
                make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
            }];
            return;
        }
        UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *efftectView = [[UIVisualEffectView alloc] initWithEffect:blur];
        UIView *bgContentView = [[UIView alloc] init];
        bgContentView.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
        [efftectView.contentView addSubview:bgContentView];
        [bgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(efftectView);
        }];
        [self.view addSubview:efftectView];
        [efftectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(self.view);
            make.height.mas_equalTo(WD_HEIGHT_NAV_BAR);
        }];
        self.fakerNavBar = efftectView;
    }
}

- (void)addTransitionNavigationBarIfNeeded {
//    if (!self.isViewLoaded) {
//        return;
//    }
    if (!self.navigationController.navigationBar) {
        return;
    }
    UINavigationBar *bar = [[UINavigationBar alloc] init];
    bar.barStyle = self.navigationController.navigationBar.barStyle;
//    bar.delegate = self;
   
//    bar.backgroundColor = self.barModel.navBarTintColor;
//    bar.barTintColor = self.barModel.navBarTintColor;
//    [bar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    bar.shadowImage = [[UIImage alloc] init];
    [self.transitionNavigationBar removeFromSuperview];
    self.transitionNavigationBar = bar;
    
    self.transitionNavigationBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 88);
    if (!self.navigationController.navigationBarHidden && !self.navigationController.navigationBar.hidden) {
        [self.view addSubview:self.transitionNavigationBar];
    }
//     [self.transitionNavigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.transitionNavigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)resizeTransitionNavigationBarFrame {
    if (!self.view.window) {
        return;
    }
    UIView *backgroundView = [self.navigationController.navigationBar valueForKey:@"_backgroundView"];
    CGRect rect = [backgroundView.superview convertRect:backgroundView.frame toView:self.view];
    self.transitionNavigationBar.frame = self.navigationController.navigationBar.bounds;
}

//- (void)hiddenNavBar {
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//    self.navigationController.navigationBar.translucent = YES;
//}

//- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar {
//    return UIBarPositionTopAttached;
//}

#pragma mark - setter
- (void)setHiddenNavBar:(BOOL)hiddenNavBar {
    if (hiddenNavBar) {
        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
       
    } else {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    }
}

#pragma mark - getter
- (BOOL)isSpecialNavBg {
    return self.navBgColor || self.hiddenNavBg;
}

- (UIView *)fakerNavBar {
    if (self.hiddenNavBg) {
        return nil;
    }
    if (!_fakerNavBar) {
        if (self.navBgColor) {
            _fakerNavBar = [[UIView alloc] init];
            _fakerNavBar.backgroundColor = self.navBgColor;
        } else {
            UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            UIVisualEffectView *efftectView = [[UIVisualEffectView alloc] initWithEffect:blur];
            UIView *bgContentView = [[UIView alloc] init];
            bgContentView.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
            [efftectView.contentView addSubview:bgContentView];
            [bgContentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(efftectView);
            }];
            _fakerNavBar = efftectView;
        }
    }
    return _fakerNavBar;
}

- (UIView *)customNavBarBg {
    SMPNavigationController *nav = (SMPNavigationController *)self.navigationController;
    if (self.hiddenNavBg) {
        return nil;
    }
    if (!_customNavBarBg) {
        if (self.navBgColor) {
            _customNavBarBg =  [[UIView alloc] init];
            _customNavBarBg.backgroundColor = self.navBgColor;
        } else {
            _customNavBarBg = nav.navBarBgEffectView;
        }
    }
    return _customNavBarBg;
}

//- (void)setNavBarBgViewHidden:(BOOL)navBarBgViewHidden {
//    _navBarBgViewHidden = navBarBgViewHidden;
//    self.navigationController.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
//    self.navigationController.navigationBar.shadowImage = UIImage()
//    self.navigationController.navigationBar.translucent = true
//    UIView *view = [self.navigationController.navigationBar valueForKey:@"_backgroundView"];
//    if ([view isKindOfClass:[UIView class]]) {
//        view.hidden = YES;
//    }
//}


@end
