//
//  ToolButtonView11.m
//  MyDemo
//
//  Created by Yong Ma on 2020/3/25.
//  Copyright © 2020 Yong Ma. All rights reserved.
//

#import "OneToolButtonView.h"

@interface OneToolButtonView()

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation OneToolButtonView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//}

-(void)setModel:(ToolButton * _Nonnull)model {
    _model = model;
    self.imageIcon.image= [UIImage imageNamed:model.icon];
    self.name.text = model.name;
}

+(instancetype)view{
    NSBundle *rootBundle = [NSBundle mainBundle];
    return  [[rootBundle loadNibNamed:@"OneToolButtonView" owner:self options:nil] lastObject];
}

@end
