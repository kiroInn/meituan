//
//  ViewController.m
//  meituan
//
//  Created by Kiro on 2020/3/25.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "ViewController.h"
#import "ModulesViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIView *headerView;
@property (nonatomic, weak) IBOutlet UIView *modulesView;
@property (nonatomic, weak) IBOutlet UIView *bottemView;
@property (nonatomic, strong) ModulesViewController *menuController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *headerView=[[[NSBundle mainBundle] loadNibNamed:@"HeaderView"owner:self options:nil] lastObject];
    CGRect rect = _headerView.frame;
    rect.origin.y = 0;
    _headerView.frame = rect;
    [self.view addSubview:headerView];
    
    UIView *modulesView = [[ModulesViewController alloc] initWithNibName:@"ModulesView"bundle:nil].view;
    rect = modulesView.frame;
    rect.origin.y = _headerView.frame.origin.y + _headerView.frame.size.height;
    modulesView.frame = rect;
    [self.view addSubview:modulesView];
    
    [[NSBundle mainBundle] loadNibNamed:@"BottomView"owner:self options:nil];
    rect = modulesView.frame;
    rect.origin.y = modulesView.frame.size.height + modulesView.frame.origin.y;
    _bottemView.frame = rect;
    [self.view addSubview:_bottemView];
}

@end
