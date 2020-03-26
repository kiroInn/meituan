//
//  MenuViewController.m
//  meituan
//
//  Created by Kiro on 2020/3/26.
//  Copyright © 2020 Kiro. All rights reserved.
//


#import "ModulesViewController.h"

@interface ModulesViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *menuCollectionViews;

@end

@implementation ModulesViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuCollectionViews.delegate = self;
    self.menuCollectionViews.dataSource = self;
    [self.menuCollectionViews registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell * cell  = [self.menuCollectionViews dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

@end
