//
//  ModulesCell.m
//  meituan
//
//  Created by Kiro on 2020/3/27.
//  Copyright © 2020 Kiro. All rights reserved.
//
#import "ModulesCell.h"
#import "ModulesModel.h"

@interface ModulesCell ()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@end

@implementation ModulesCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"ModulesCell" owner:self options:nil].lastObject;
        self.image.layer.cornerRadius = 15;
    }
    return self;
}
-(void)setModel:(ModulesModel *) model{
    self.title.text = model.title;
    self.image.image = [UIImage imageNamed:model.image];
}

@end
