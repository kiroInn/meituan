//
//  SwiperViewController.m
//  meituan
//
//  Created by Zhimao Lin on 2020/3/27.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "SwiperViewController.h"

@interface SwiperViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *swiperView;
@property (nonatomic) NSInteger SWIPER_COUNT;
@property (nonatomic) NSInteger currentShowingIndexOfSwiperCell;
@property (nonatomic) CGFloat willBeginDraggingX;
@property (nonatomic) CGFloat willEndDraggingX;
@property (strong, nonatomic) NSArray<NSString *> *swiperImageNames;
@end

@implementation SwiperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentShowingIndexOfSwiperCell = 0;
    _swiperImageNames = @[@"swiper1", @"swiper2", @"swiper3"];
    _SWIPER_COUNT = _swiperImageNames.count;
    _swiperView.layer.cornerRadius = 8;
    [_swiperView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"swiperCell"];
    
    CGFloat swiperWidth = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat swiperHeight = swiperWidth * 219 / 700;
    _swiperView.bounds = CGRectMake(0, 0, swiperWidth, swiperHeight);
}

-(void)viewWillAppear:(BOOL)animated {
    [self performSelector:@selector(task) withObject:nil afterDelay:3];
}

- (void)viewWillDisappear:(BOOL)animated {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(task) object:nil];
}

- (void)task {
    [self scrollToNextIndexForSwiper:true];
    [self performSelector:@selector(task) withObject:nil afterDelay:3];
}

- (void)addIndexForSwiper:(NSInteger)num :(BOOL)loop {
    NSInteger tempResult = _currentShowingIndexOfSwiperCell + num;

    if(loop) {
        tempResult %= _SWIPER_COUNT;
    }

    if(tempResult >= 0 && tempResult < _SWIPER_COUNT) {
        _currentShowingIndexOfSwiperCell += num;
    }

    _currentShowingIndexOfSwiperCell = _currentShowingIndexOfSwiperCell % _SWIPER_COUNT;
}

- (void)scrollToIndexForSwiper {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_currentShowingIndexOfSwiperCell inSection:0];
    [_swiperView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:true];
}

- (void)scrollToPreviousIndexForSwiper:(BOOL)loop {
    [self addIndexForSwiper:-1 :loop];
    [self scrollToIndexForSwiper];
}

- (void)scrollToNextIndexForSwiper:(BOOL)loop {
    [self addIndexForSwiper:1 :loop];
    [self scrollToIndexForSwiper];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"swiperCell" forIndexPath:indexPath];

    UIImage *uiImage = [UIImage imageNamed:_swiperImageNames[indexPath.item]];
    UIImageView *uiImageView = [[UIImageView alloc] initWithImage:uiImage];
    uiImageView.layer.cornerRadius = 8;
    cell.backgroundView = uiImageView;
    [cell addSubview:uiImageView];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _SWIPER_COUNT;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return _swiperView.bounds.size;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _willBeginDraggingX = scrollView.contentOffset.x;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    _willEndDraggingX = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    _willEndDraggingX = scrollView.contentOffset.x;
    if(_willEndDraggingX > _willBeginDraggingX) {
        [self scrollToNextIndexForSwiper:false];
    }
    else {
        [self scrollToPreviousIndexForSwiper:false];
    }
}

@end
