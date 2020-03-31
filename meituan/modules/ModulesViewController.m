//
//  MenuViewController.m
//  meituan
//
//  Created by Kiro on 2020/3/26.
//  Copyright © 2020 Kiro. All rights reserved.
//


#import "ModulesViewController.h"
#import "ModulesCell.h"
#import "ColorUtil.h"
#import "more/MoreViewController.h"

@interface ModulesViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *modulesCollectionViews;
@property (strong, nonatomic) NSArray *modulesArray;

@end

@implementation ModulesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _modulesArray = @[
                      @{@"image": @"meituan", @"title": @"外卖"},
                      @{@"image": @"food", @"title": @"美食"},
                      @{@"image": @"hotel", @"title": @"酒店/住宿"},
                      @{@"image": @"rest", @"title": @"休闲/玩乐"},
                      @{@"image": @"move", @"title": @"电影/演出"},
                      
                      @{@"image": @"car", @"title": @"打车"},
                      @{@"image": @"decorate", @"title": @"买菜"},
                      @{@"image": @"supermarket", @"title": @"超市/药店"},
                      @{@"image": @"money", @"title": @"借钱/信用卡"},
                      @{@"image": @"ticket", @"title": @"火车票/机票"},
                      
                      @{@"image": @"welfare", @"title": @"福利"},
                      @{@"image": @"supermarket", @"title": @"免费领福利"},
                      @{@"image": @"red-package", @"title": @"红包签到"},
                      @{@"image": @"decorate", @"title": @"家局/装修"},
                      @{@"image": @"more", @"title": @"更多"},
                      ];
    [self setGradientLayer];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 6.0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(15, 0, 0, 0);
    self.modulesCollectionViews.collectionViewLayout = layout;
    self.modulesCollectionViews.layer.cornerRadius = 20.0;
    self.modulesCollectionViews.delegate = self;
    self.modulesCollectionViews.dataSource = self;
    [self.modulesCollectionViews registerClass:[ModulesCell class] forCellWithReuseIdentifier:@"modulesCell"];
    _modulesCollectionViews.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 270);
}

- (void)setGradientLayer {
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(0, 1);
    layer.colors = [NSArray arrayWithObjects:(id) ssRGBHex(0xffcf01).CGColor, (id)[UIColor whiteColor].CGColor,nil];
    layer.locations = @[@0.0f,@0.6f];
    layer.frame = self.view.layer.bounds;
    [self.view.layer insertSublayer:layer atIndex:0];
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ModulesCell * cell = [self.modulesCollectionViews dequeueReusableCellWithReuseIdentifier:@"modulesCell" forIndexPath:indexPath];
    ModulesModel * model = [ModulesModel alloc];
    model.title = _modulesArray[indexPath.item][@"title"];
    model.image = _modulesArray[indexPath.item][@"image"];
    [cell setModel:model];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modulesArray.count;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake((screenWidth - 50) / 5, 70);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        MoreViewController *moreViewController = [[UIStoryboard storyboardWithName:@"MoreView"bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"MoreView"];
        [self.navigationController pushViewController:moreViewController animated:YES];
}

@end
