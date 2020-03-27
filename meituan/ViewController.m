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


@interface ViewController ()
@property(nonatomic, weak) IBOutlet UIView *headerView;
@property(nonatomic, strong) IBOutlet UIView *toolButtonView;
@property(nonatomic, weak) IBOutlet UIView *hotView;
@property(nonatomic, weak) IBOutlet UIView *modulesView;
@property(nonatomic, weak) IBOutlet UIView *bottemView;
@property(nonatomic, strong) ModulesViewController *menuController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    NSLog(@"_toolButtonView========%@", NSStringFromCGRect(_toolButtonView.frame));
    [self.view addSubview:_toolButtonView];


    UIView *modulesView = [[ModulesViewController alloc] initWithNibName:@"ModulesView" bundle:nil].view;
    rect = modulesView.frame;
    rect.origin.y = _toolButtonView.frame.origin.y + _toolButtonView.frame.size.height;
    modulesView.frame = rect;
    [self.view addSubview:modulesView];

    [[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:self options:nil];
    rect = modulesView.frame;
    rect.origin.y = modulesView.frame.size.height + modulesView.frame.origin.y;
    _bottemView.frame = rect;
    [self.view addSubview:_bottemView];
}
@end
