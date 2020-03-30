//
//  ViewController.m
//  meituan
//
//  Created by Kiro on 2020/3/25.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "ViewController.h"
#import "ModulesViewController.h"
#import "ToolButtonView.h"
#import "ToolButton.h"
#import "OneToolButtonView.h"
#import "SwiperViewController.h"
#import "ColorUtil.h"
#import "StoreListViewController.h"

@interface ViewController ()
@property(nonatomic, weak) IBOutlet UIView *headerView;
@property(nonatomic, strong) IBOutlet UIView *toolButtonView;
@property(nonatomic, weak) IBOutlet UIView *hotView;
@property(nonatomic, weak) IBOutlet UIView *modulesView;
@property(nonatomic, weak) IBOutlet UIView *bottemView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:204 green:204 blue:204 alpha:1];
    // Do any additional setup after loading the view.
    NSBundle *rootBundle = [NSBundle mainBundle];
    _headerView = [[rootBundle loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
    CGRect rect = _headerView.frame;
    _headerView.frame = rect;
    [self.view addSubview:_headerView];

    _hotView = [[rootBundle loadNibNamed:@"HotView" owner:nil options:nil] lastObject];
    rect = _headerView.frame;
    rect.origin.y = _headerView.frame.origin.y + _headerView.frame.size.height;
    rect.size.height = _hotView.frame.size.height + 20;
    NSLog(@"_hotView =====%@", NSStringFromCGRect(rect));
    _hotView.frame = rect;
    [self.view addSubview:_hotView];

    rect = _hotView.frame;
    rect.origin.y = _hotView.frame.origin.y + _hotView.frame.size.height;
    rect.origin.x = 0;
    rect.size.height = 70;
    NSLog(@"_toolButtonView========%@", NSStringFromCGRect(rect));
    _toolButtonView = [[ToolButtonView alloc] initWithFrame:rect];
    _toolButtonView.backgroundColor =  ssRGBHex(0xffcf01);
    NSLog(@"_toolButtonView========%@", NSStringFromCGRect(_toolButtonView.frame));
    [self.view addSubview:_toolButtonView];

    UIViewController *modulesController = [[ModulesViewController alloc] initWithNibName:@"ModulesView" bundle:nil];
    UIView *modulesView = modulesController.view;
    rect = modulesView.frame;
    rect.origin.y = _toolButtonView.frame.origin.y + _toolButtonView.frame.size.height;
    modulesView.frame = rect;
    [self.view addSubview:modulesView];
    [self addChildViewController:modulesController];
    [modulesController didMoveToParentViewController:self];

    UIView *swiperView = [[SwiperViewController alloc] initWithNibName:@"SwiperView" bundle:nil].view;
    rect = swiperView.frame;
    rect.origin.x = 10;
    rect.origin.y = modulesView.frame.origin.y + modulesView.frame.size.height + 20;
    swiperView.frame = rect;
    [self.view addSubview:swiperView];

    UIView *storeListView = [[StoreListViewController alloc] initWithNibName:@"StoreListView" bundle:nil].view;
    rect = storeListView.frame;
    rect.origin.x = 10;
    rect.origin.y = swiperView.frame.origin.y + swiperView.frame.size.height + 20;
    storeListView.frame = rect;
    [self.view addSubview:storeListView];
}
@end
