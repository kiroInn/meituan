//
//  ToolButton.m
//  meituan
//
//  Created by Yong Ma on 2020/3/26.
//  Copyright © 2020 Kiro. All rights reserved.
//

#import "ToolButton.h"

@implementation ToolButton


- (instancetype) initWithDic:(NSDictionary *)dictionary{
    if(self = [super init]){
        self.name = dictionary[@"name"];
        self.icon = dictionary[@"icon"];
    }
    return self;
}
+ (instancetype) tooButtonWithDic:(NSDictionary *)dictionary{
    return [[self alloc] initWithDic:dictionary];
}
@end
