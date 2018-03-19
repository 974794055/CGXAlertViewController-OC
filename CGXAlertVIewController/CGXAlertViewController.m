//
//  CGXAlertViewController.m
//  CGXAppStructure
//
//  Created by 曹贵鑫 on 2017/6/21.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXAlertViewController.h"

static void (^G_completionBlock)(int buttonindex);

@implementation CGXAlertViewController

#pragma mark - 样式选择  返回的有title   中间显示
+ (void)showAlertViewStyleWithTitle:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles titleBlock:(void (^)(NSString *, NSString *, NSString *))titleBlock showViewController:(UIViewController *)vc
{
    [CGXAlertViewController showAlertViewControllerWithTitle:title message:message buttonTitles:buttonTitles showViewController:vc completionBlock:^(NSString *Btntitle) {
        if (titleBlock) {
            titleBlock(title,message,Btntitle);
        }
    } preferredStyle:UIAlertControllerStyleAlert];
}
+ (void)showAlertViewStyleWithTitle:(NSString*)title message:(NSString*)message buttonTitles:(NSArray*)buttonTitles titleBlock:(void(^)(NSString *titleStr ,NSString *messageStr ,NSString *btntitleStr))titleBlock showViewController:(UIViewController*)vc preferredStyle:(UIAlertControllerStyle)style;
{
    [CGXAlertViewController showAlertViewControllerWithTitle:title message:message buttonTitles:buttonTitles showViewController:vc completionBlock:^(NSString *Btntitle) {
        if (titleBlock) {
            titleBlock(title,message,Btntitle);
        }
    } preferredStyle:style];
}

#pragma mark - 自定义样式
+ (void)showAlertViewControllerWithTitle:(NSString*)title message:(NSString*)message buttonTitles:(NSArray*)buttonTitles showViewController:(UIViewController*)vc completionBlock:(void(^)(NSString *Btntitle))completionBlock  preferredStyle:(UIAlertControllerStyle)style{
#ifdef NSFoundationVersionNumber_iOS_8_0
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    for (NSString* titleStr in buttonTitles) {
        UIAlertAction* action;
        if ([titleStr isEqualToString:@"取消"] || [titleStr isEqualToString:@"cancel"]) {
            action = [UIAlertAction actionWithTitle:titleStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                if (completionBlock) {
                    completionBlock(titleStr);
                }
            }];
        }else {
            action = [UIAlertAction actionWithTitle:titleStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (completionBlock) {
                    completionBlock(titleStr);
                }
            }];
        }
        [alert addAction:action];
    }
    [vc presentViewController:alert animated:YES completion:nil];
#else
    G_completionBlock = [completionblock copy];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:strtitle message:strmessage delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    for (NSString *key in buttontitles) {
        [alert addButtonWithTitle:key];
    }
    [alert show];
#endif
}
#pragma clang diagnostic ignored "-Wdeprecated"
+(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (G_completionBlock) {
        G_completionBlock((int)buttonIndex);
    }
}



@end
