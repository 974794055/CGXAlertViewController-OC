//
//  CGXAlertViewController.m
//  CGXAppStructure
//
//  Created by CGX on 2017/6/21.
//  Copyright © 2017年 CGX. All rights reserved.
//

#import "CGXAlertViewController.h"
#import "UIAlertController+CGXAlertColor.h"

@interface CGXAlertViewController()

@end

@implementation CGXAlertViewController

#pragma mark - 样式选择  返回的有title   中间显示
+ (void)showAlertTitle:(NSString *)title
                   message:(NSString *)message
              ButTitles:(NSArray*)butTitles
               SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock
{
    [CGXAlertViewController showAlertTitle:title message:message ButTitles:butTitles TitleBlock:nil ActionModleBlock:nil SelectBlock:selectBlock];
}
+ (void)showAlertTitle:(NSString*)title
                   message:(NSString*)message
              ButTitles:(NSArray*)butTitles
                TitleBlock:(CGXAlertViewControllerTitleBlock)titleBlock
          ActionModleBlock:(CGXAlertViewControllerActionBlock)actionModleBlock
               SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock
{
    [CGXAlertViewController showAlertViewControllerWithTitle:title message:message ButTitles:butTitles TitleBlock:titleBlock ActionModleBlock:actionModleBlock SelectBlock:selectBlock preferredStyle:UIAlertControllerStyleAlert];
}
+ (void)showActionTitle:(NSString*)title
                         message:(NSString*)message
                   ButTitles:(NSArray*)butTitles
                     SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock
{
    [CGXAlertViewController showActionTitle:title message:message ButTitles:butTitles TitleBlock:nil ActionModleBlock:nil SelectBlock:selectBlock];
}

+ (void)showActionTitle:(NSString*)title
                         message:(NSString*)message
                    ButTitles:(NSArray*)butTitles
                      TitleBlock:(CGXAlertViewControllerTitleBlock)titleBlock
                ActionModleBlock:(CGXAlertViewControllerActionBlock)actionModleBlock
                     SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock
{
     [CGXAlertViewController showAlertViewControllerWithTitle:title message:message ButTitles:butTitles TitleBlock:titleBlock ActionModleBlock:actionModleBlock SelectBlock:selectBlock preferredStyle:UIAlertControllerStyleActionSheet];
}

#pragma mark - 自定义样式
+ (void)showAlertViewControllerWithTitle:(NSString*)title
                                 message:(NSString*)message
                            ButTitles:(NSArray*)butTitles
                              TitleBlock:(CGXAlertViewControllerTitleBlock)titleBlock
                        ActionModleBlock:(CGXAlertViewControllerActionBlock)actionModleBlock
                         SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock
                          preferredStyle:(UIAlertControllerStyle)style{
    if ([self getIsIpad]) {
        style = UIAlertControllerStyleAlert;
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    CGXAlertTitleModel *titleModel = [[CGXAlertTitleModel alloc] init];
    alert.titleFont = titleModel.titleFont;
    alert.titleColor = titleModel.titleColor;
    alert.messageFont = titleModel.messageFont;
    alert.messageColor = titleModel.messageColor;
    if (titleBlock) {
        titleBlock(titleModel);
    }
    alert.titleFont = titleModel.titleFont;
    alert.titleColor = titleModel.titleColor;
    alert.messageFont = titleModel.messageFont;
    alert.messageColor = titleModel.messageColor;
    for (NSString* titleStr in butTitles) {
        UIAlertAction* action;
        CGXAlertActionModel *item = [[CGXAlertActionModel alloc] init];
        item.title = titleStr;
        item.titleColor = [UIColor blackColor];
        item.style = UIAlertActionStyleDefault;
        if ([item.title isEqualToString:@"取消"] || [item.title isEqualToString:@"cancel"]) {
            item.style = UIAlertActionStyleCancel;
            item.titleColor = [UIColor redColor];
        }
        if (actionModleBlock) {
            actionModleBlock(item);
        }
        action = [UIAlertAction actionWithTitle:item.title style:item.style handler:^(UIAlertAction * _Nonnull action) {
            if (selectBlock) {
                selectBlock(title,message,item.title);
            }
        }];
        [action setValue:item.titleColor forKey:@"_titleTextColor"];
        [alert addAction:action];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}

+ (BOOL)getIsIpad
{
    BOOL isIpad = NO;
    if([[UIDevice currentDevice].model isEqualToString:@"iPad"] || [[UIDevice currentDevice] userInterfaceIdiom] ==
       UIUserInterfaceIdiomPad){
        isIpad = YES;
    }
    return isIpad;
}

@end
