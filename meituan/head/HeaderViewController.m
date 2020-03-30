//
//  HeaderViewController.m
//  meituan
//
//  Created by Yong Ma on 2020/3/30.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "HeaderViewController.h"
#import "SearchPageViewController.h"
#import "EWAddressViewController.h"

@interface HeaderViewController ()
@property(strong,nonatomic) NSArray *array;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property(strong,nonatomic)  NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *location;

@end

@implementation HeaderViewController
- (IBAction)toSearch:(id)sender {
    NSLog(@"scscssfsf=======");
    SearchPageViewController *controller = [[UIStoryboard storyboardWithName:@"SearchPage" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"SearchPage"];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _array=@[@"XXX酒店",@"肉夹馍来了",@"纯净水",@"你说啥",@"不知道"];
    // Do any additional setup after loading the view.
}

- (IBAction)selectLocation:(id)sender {
     EWAddressViewController *VC = [[EWAddressViewController alloc]init];
        ///保证弹出viewController背景色为透明
        self.definesPresentationContext = YES;
        VC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        ///block弱引用防止循环引用.
        __weak typeof(self) weakSelf = self;
        VC.backLocationString = ^(NSString *address, NSString *province, NSString *city, NSString *area) {
            // 返回选择数据,地址,省,市,区
            NSLog(@"location = %@",address);
            NSArray *array = [address componentsSeparatedByString:@" "];
//            [array lastObject];
            [weakSelf.location setTitle:[array lastObject] forState:UIControlStateNormal];
        };
        [self.parentViewController presentViewController:VC animated:true completion:nil];

}

-(void) task{
    static int count=0;
    NSLog(@"qiehuanhuanj");
    CGRect rect = self.searchButton.titleLabel.frame;
    [UIView animateWithDuration:0.2 animations:^{
        [self.searchButton setTitle:@"" forState:UIControlStateNormal];
        self.searchButton.titleLabel.frame  = CGRectMake(rect.origin.x, rect.origin.y - 15, rect.size.width, rect.size.height);
    }];
    self.searchButton.titleLabel.frame  = rect;
     [self.searchButton setTitle:[self.array objectAtIndex:count % self.array.count] forState:UIControlStateNormal];
    count++;
}


-(void)viewWillAppear:(BOOL)animated{
    _timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(task) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"已viewWillDisappear1");
   if (self.timer != nil) {
       NSLog(@"已viewWillDisappear2");
       [self.timer invalidate];
       self.timer = nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
