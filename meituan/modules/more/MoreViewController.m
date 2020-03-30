//
//  MoreViewController.m
//  meituan
//
//  Created by Kiro on 2020/3/29.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.barStyle =UIBarStyleDefault;
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"BACK"style:UIBarButtonItemStylePlain target:self action:@selector(buttonClick:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self setTitle:@"More View"];
}

- (void)buttonClick:(UIButton *)sender {
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

@end

