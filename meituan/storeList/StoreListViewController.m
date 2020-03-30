//
//  StoreListViewController.m
//  meituan
//
//  Created by Zhimao Lin on 2020/3/27.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "StoreListViewController.h"

@interface StoreListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *storeListView;
@property (strong, nonatomic) NSArray<NSString *> *storeListImageNames;
@property (strong, nonatomic) NSArray<NSString *> *storeListDescriptions;
@property (nonatomic) NSInteger STORE_LIST_COUNT;
@property (nonatomic) CGFloat STORE_LIST_WIDTH;
@property (nonatomic) CGFloat STORE_CELL_WIDTH;
@end

@implementation StoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _storeListImageNames = @[@"store1", @"store2", @"store3", @"store4", @"store5", @"store6"];
    _storeListDescriptions = @[@"无骨烤鱼饭（万意美食城店）", @"肯德基c宅急送（天通苑西店）", @"田老师红烧肉（北苑p卜蜂莲花店）", @"高端枸杞", @"新鲜水果草莓", @"海南西瓜"];
    _STORE_LIST_COUNT = _storeListImageNames.count;
    _storeListView.layer.cornerRadius = 8;
    [_storeListView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"storeListCell"];
    _STORE_LIST_WIDTH = [UIScreen mainScreen].bounds.size.width - 40;
    _STORE_CELL_WIDTH = (_STORE_LIST_WIDTH - 20) / 2;
    
    CGRect rect = _storeListView.frame;
    rect.size.width = _STORE_LIST_WIDTH;
    _storeListView.frame = rect;
    _storeListView.backgroundColor = [UIColor colorWithRed:204 green:204 blue:204 alpha:1];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"storeListCell" forIndexPath:indexPath];

    UIImage *uiImage = [UIImage imageNamed:_storeListImageNames[indexPath.item]];
    UIImageView *uiImageView = [[UIImageView alloc] initWithImage:uiImage];
    uiImageView.contentMode = UIViewContentModeScaleToFill;
    CGRect rect = uiImageView.frame;
    rect.size.width = _STORE_CELL_WIDTH;
    rect.size.height = _STORE_CELL_WIDTH;
    uiImageView.frame = rect;
    uiImageView.layer.cornerRadius = 8;
    [cell addSubview:uiImageView];

    UILabel *label = [UILabel new];
    label.text = _storeListDescriptions[indexPath.item];
    rect = label.frame;
    rect.size.width = _STORE_CELL_WIDTH - 20;
    rect.size.height = 60;
    rect.origin.x = uiImageView.frame.origin.x + 10;
    rect.origin.y = uiImageView.frame.origin.y + uiImageView.frame.size.height;
    label.frame = rect;
    [label setFont:[UIFont systemFontOfSize:(14) weight:UIFontWeightBold]];
    [label setNumberOfLines:0];
    [cell addSubview:label];
    cell.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    cell.layer.cornerRadius = 8;
    cell.layer.shadowOpacity = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _STORE_LIST_COUNT;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(_STORE_CELL_WIDTH, _STORE_CELL_WIDTH + 60);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
