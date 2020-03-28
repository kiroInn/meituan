//
//  HeaderView.m
//  meituan
//
//  Created by Yong Ma on 2020/3/27.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "HeaderView.h"

@interface  HeaderView()
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) NSArray<NSString *> *array;
@end


@implementation HeaderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    _array=@[@"XXX酒店",@"肉夹馍来了",@"纯净水",@"你说啥",@"不知道"];
  [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(task) userInfo:nil repeats:YES];
}

-(void) task{
    static int count=0;
    CGRect rect = self.searchButton.titleLabel.frame;
    [UIView animateWithDuration:0.3 animations:^{
        self.searchButton.titleLabel.frame  = CGRectMake(rect.origin.x, rect.origin.y - 50, rect.size.width, rect.size.height);
    }];
    self.searchButton.titleLabel.frame  = rect;
     [self.searchButton setTitle:[self.array objectAtIndex:count % self.array.count] forState:UIControlStateNormal];
    count++;
}

@end
