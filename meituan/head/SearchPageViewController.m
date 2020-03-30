//
//  SearchPageViewController.m
//  meituan
//
//  Created by Yong Ma on 2020/3/30.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "SearchPageViewController.h"

@interface SearchPageViewController ()

@end

@implementation SearchPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)back:(id)sender {
    NSLog(@"click back");
    [self.navigationController popViewControllerAnimated:true];
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
