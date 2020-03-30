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
@property(nonatomic, weak) IBOutlet UIView *swiperView;
@property(nonatomic, weak) IBOutlet UIView *storeListView;
@property(nonatomic, weak) IBOutlet UIView *bottemView;
@property(nonatomic, strong) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPageStyle];
    [self addHeaderView];
    [self addScrollView];
    [self addHotView];
    [self addToolButtonView];
    [self addModulesView];
    [self addSwiperView];
    [self addStoreListView];
}

- (void)viewDidAppear:(BOOL)animated {
    UICollectionView *storeList = (UICollectionView *)_storeListView;
    
    CGFloat contentSizeOfScrollView =  _hotView.bounds.size.height
        + _toolButtonView.bounds.size.height
        + _modulesView.bounds.size.height
        + _swiperView.bounds.size.height
        + storeList.collectionViewLayout.collectionViewContentSize.height + 60;
    [_scrollView setContentSize:CGSizeMake(_scrollView.bounds.size.width, contentSizeOfScrollView)];
}

- (void)setPageStyle {
    self.view.backgroundColor = [UIColor colorWithRed:204 green:204 blue:204 alpha:1];
}

- (void)addHeaderView {
    NSBundle *rootBundle = [NSBundle mainBundle];
    _headerView = [[rootBundle loadNibNamed:@"HeaderView" owner:nil options:nil] lastObject];
    CGRect rect = _headerView.frame;
    _headerView.frame = rect;
    [self.view addSubview:_headerView];
}

- (void)addScrollView {
    _scrollView = [UIScrollView new];
    _scrollView.scrollEnabled = YES;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.alwaysBounceVertical = YES;
    CGRect rect = _scrollView.frame;
    CGFloat headerEndPoint = _headerView.frame.origin.y + _headerView.frame.size.height;
    rect.origin.y = headerEndPoint;
    rect.size.width = [UIScreen mainScreen].bounds.size.width;
    rect.size.height = [UIScreen mainScreen].bounds.size.height - headerEndPoint - 20;
    _scrollView.frame = rect;
}

- (void)addHotView {
    NSBundle *rootBundle = [NSBundle mainBundle];
    _hotView = [[rootBundle loadNibNamed:@"HotView" owner:nil options:nil] lastObject];
    CGRect rect = _headerView.frame;
    rect.origin.y = 0;
    rect.size.height = _hotView.frame.size.height + 20;
    _hotView.frame = rect;
    [_scrollView addSubview:_hotView];
}

- (void)addToolButtonView {
    CGRect rect = _hotView.frame;
    rect.origin.y = _hotView.frame.origin.y + _hotView.frame.size.height;
    rect.origin.x = 0;
    rect.size.height = 70;
    _toolButtonView = [[ToolButtonView alloc] initWithFrame:rect];
    _toolButtonView.backgroundColor =  ssRGBHex(0xffcf01);
    [_scrollView addSubview:_toolButtonView];
}

- (void)addModulesView {
    UIViewController *modulesController = [[ModulesViewController alloc] initWithNibName:@"ModulesView" bundle:nil];
    _modulesView = modulesController.view;
    CGRect rect = _modulesView.frame;
    rect.origin.y = _toolButtonView.frame.origin.y + _toolButtonView.frame.size.height;
    _modulesView.frame = rect;
    [_scrollView addSubview:_modulesView];
    [self addChildViewController:modulesController];
    [modulesController didMoveToParentViewController:self];
}

- (void)addSwiperView {
    _swiperView = [[SwiperViewController alloc] initWithNibName:@"SwiperView" bundle:nil].view;
    CGRect rect = _swiperView.frame;
    rect.origin.x = 10;
    rect.origin.y = _modulesView.frame.origin.y + _modulesView.frame.size.height;
    _swiperView.frame = rect;
    [_scrollView addSubview:_swiperView];
}

- (void)addStoreListView {
    _storeListView = [[StoreListViewController alloc] initWithNibName:@"StoreListView" bundle:nil].view;
    CGRect rect = _storeListView.frame;
    rect.origin.x = 10;
    rect.origin.y = _swiperView.frame.origin.y + _swiperView.frame.size.height + 20;
    _storeListView.frame = rect;
    [_scrollView addSubview:_storeListView];
    [self.view addSubview:_scrollView];
}

@end
