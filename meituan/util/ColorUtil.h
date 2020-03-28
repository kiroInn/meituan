//
//  ColorUtil.h
//  meituan
//
//  Created by Kiro on 2020/3/28.
//  Copyright © 2020 Kiro. All rights reserved.
//
#import <Foundation/Foundation.h>

#define ssRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface ColorUtil : NSObject
@end
