//
//  CGXAlertTitleModel.m
//  CGXAlertVIewControllerDemo
//
//  Created by CGX on 2019/8/5.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXAlertTitleModel.h"

@implementation CGXAlertTitleModel
- (instancetype)init{
    if (self = [super init]) {
        self.titleFont = [UIFont systemFontOfSize:18];
        self.titleColor = [UIColor blackColor];
        self.messageFont = [UIFont systemFontOfSize:14];
        self.messageColor = [UIColor grayColor];
    }
    return self;
}
@end
