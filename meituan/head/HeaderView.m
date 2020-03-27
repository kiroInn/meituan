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

@end


@implementation HeaderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(task) userInfo:nil repeats:YES];
}

-(void) task{
    static int count=0;
    [self.searchButton setTitle:[NSString stringWithFormat:@"时事新闻%d",count] forState:UIControlStateNormal];
    count++;
}
@end
