//
//  CGXAlertActionModel.m
//  CGXAlertVIewControllerDemo
//
//  Created by CGX on 2019/7/3.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXAlertActionModel.h"

@implementation CGXAlertActionModel
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"";
        self.titleFont = [UIFont systemFontOfSize:14];
        self.style = UIAlertActionStyleDefault;
        self.titleColor = [UIColor blackColor];
    }
    return self;
}
@end
