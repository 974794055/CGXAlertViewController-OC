//
//  UIAlertController+CGXAlertColor.m
//  CGXAlertVIewControllerDemo
//
//  Created by MacMini-1 on 2019/7/3.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "UIAlertController+CGXAlertColor.h"
#import <objc/runtime.h>
@implementation UIAlertController (CGXAlertColor)
-(UIFont *)titleFont{
    return objc_getAssociatedObject(self, @selector(titleFont));
}

-(void)setTitleFont:(UIFont *)titleFont {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIAlertController class], &count);
    for(int i = 0;i < count;i ++){
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        //标题颜色
        if ([ivarName isEqualToString:@"_attributedTitle"] && self.title && titleFont) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:self.title attributes:@{NSForegroundColorAttributeName:self.titleColor?:[UIColor blackColor],NSFontAttributeName:titleFont}];
            [self setValue:attr forKey:@"attributedTitle"];
        }
    }
    free(ivars);
    objc_setAssociatedObject(self, @selector(titleFont), titleFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)titleColor{
    return objc_getAssociatedObject(self, @selector(titleColor));
}

-(void)setTitleColor:(UIColor *)titleColor{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIAlertController class], &count);
    for(int i = 0;i < count;i ++){
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        //标题颜色
        if ([ivarName isEqualToString:@"_attributedTitle"] && self.title && titleColor) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:self.title attributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:self.titleFont?:[UIFont boldSystemFontOfSize:14.0]}];
            [self setValue:attr forKey:@"attributedTitle"];
        }
    }
    free(ivars);
    objc_setAssociatedObject(self, @selector(titleColor), titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIColor *)messageColor{
    return objc_getAssociatedObject(self, @selector(messageColor));
}

-(void)setMessageColor:(UIColor *)messageColor{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIAlertController class], &count);
    for(int i = 0;i < count;i ++){
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        //描述颜色
        if ([ivarName isEqualToString:@"_attributedMessage"] && self.message && messageColor) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.message attributes:@{NSForegroundColorAttributeName:messageColor,NSFontAttributeName:self.messageFont?:[UIFont systemFontOfSize:14.0]}];
            [self setValue:attr forKey:@"attributedMessage"];
        }
    }
    free(ivars);
    objc_setAssociatedObject(self, @selector(messageColor), messageColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIFont *)messageFont{
    return objc_getAssociatedObject(self, @selector(messageFont));
}

-(void)setMessageFont:(UIFont *)messageFont{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIAlertController class], &count);
    for(int i = 0;i < count;i ++){
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        //描述颜色
        if ([ivarName isEqualToString:@"_attributedMessage"] && self.message && messageFont) {
            NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.message attributes:@{NSForegroundColorAttributeName:self.messageColor?:[UIColor blackColor],NSFontAttributeName:messageFont}];
            [self setValue:attr forKey:@"attributedMessage"];
        }
    }
    free(ivars);
    objc_setAssociatedObject(self, @selector(messageFont), messageFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
