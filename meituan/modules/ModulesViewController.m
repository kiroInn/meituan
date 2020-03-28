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

@interface ModulesViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *menuCollectionViews;

@end

@implementation ModulesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setGradientLayer];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.menuCollectionViews.collectionViewLayout = layout;
    self.menuCollectionViews.layer.cornerRadius = 20.0;
    self.menuCollectionViews.delegate = self;
    self.menuCollectionViews.dataSource = self;
    [self.menuCollectionViews registerClass:[ModulesCell class] forCellWithReuseIdentifier:@"modulesCell"];
    _menuCollectionViews.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 240);
    [self.menuCollectionViews registerNib:[UINib nibWithNibName:@"ModulesCell" bundle:nil] forCellWithReuseIdentifier:@"ModulesCell"];
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
    ModulesCell * cell = [self.menuCollectionViews dequeueReusableCellWithReuseIdentifier:@"modulesCell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake((screenWidth - 100) / 5, 68);
}

@end
