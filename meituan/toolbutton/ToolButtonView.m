//
//  ToolButtonView.m
//  meituan
//
//  Created by Yong Ma on 2020/3/26.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "ToolButtonView.h"
#import "ToolButton.h"
#import "OneToolButtonView.h"

@implementation ToolButtonView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"ToolButtonView======%@",NSStringFromCGRect(rect));
    NSString *path = [[NSBundle mainBundle] pathForResource:@"toolButton.plist" ofType:nil];
    NSArray *arrayDicts = [NSArray arrayWithContentsOfFile:path];

    CGFloat index = 0;
    CGFloat colNum = arrayDicts.count;
    CGFloat toolButtonHeight;
    CGFloat toolButtonWidth = rect.size.width / colNum;
    
    
    for (NSDictionary *dict in arrayDicts) {
        ToolButton *toolbutton = [ToolButton tooButtonWithDic:dict];
        OneToolButtonView *view = [OneToolButtonView view];
        CGRect toolButtonRect = view.frame;
        toolButtonHeight = toolButtonRect.size.height - 44;
        NSLog(@"toolButtonHeight ======%f", toolButtonHeight);
        view.model = toolbutton;
        CGFloat pointX = toolButtonWidth * index + (toolButtonWidth - toolButtonRect.size.width) / 2;
        view.frame = CGRectMake(pointX, rect.origin.y, toolButtonWidth, toolButtonHeight);
        [self addSubview:view];
        index++;
    }
}


@end
