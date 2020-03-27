//
//  ToolButton.h
//  meituan
//
//  Created by Yong Ma on 2020/3/26.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToolButton : NSObject
@property(strong,nonatomic) NSString *icon;
@property(strong,nonatomic) NSString *name;

- (instancetype) initWithDic:(NSDictionary *)dictionary;
+ (instancetype) tooButtonWithDic:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
