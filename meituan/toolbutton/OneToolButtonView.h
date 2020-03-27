//
//  ToolButtonView11.h
//  MyDemo
//
//  Created by Yong Ma on 2020/3/25.
//  Copyright © 2020 Yong Ma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface OneToolButtonView : UIView

@property(strong,nonatomic) ToolButton *model;


-(void)setModel:(ToolButton * _Nonnull)model;
+(instancetype)view;
@end

NS_ASSUME_NONNULL_END
