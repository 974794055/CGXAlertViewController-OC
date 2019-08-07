//
//  ViewController.m
//  CGXAlertVIewControllerDemo
//
//  Created by MacMini-1 on 2019/7/3.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "ViewController.h"

#import "CGXAlertViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [CGXAlertViewController showAlertTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
        NSLog(@"%@--%@--%@",title,message,btnStr);
    }];
    
    //    [CGXAlertViewController showAlertTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] TitleBlock:^(CGXAlertTitleModel *titleModel) {
    //        titleModel.titleFont = [UIFont systemFontOfSize:20];
    //        titleModel.titleColor = [UIColor blackColor];
    //    } ActionModleBlock:^(CGXAlertActionModel *actionModel) {
    //        actionModel.titleColor = [UIColor redColor];
    //    } SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
    //         NSLog(@"%@--%@--%@",title,message,btnStr);
    //    }];
    //
    
    //    [CGXAlertViewController showActionTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
    //         NSLog(@"%@--%@--%@",title,message,btnStr);
    //    }];
    
    [CGXAlertViewController showActionTitle:@"温馨提示" message:@"过期啦" ButTitles:@[@"取消",@"确认"] TitleBlock:^(CGXAlertTitleModel *titleModel) {
        titleModel.titleFont = [UIFont systemFontOfSize:20];
        titleModel.titleColor = [UIColor blackColor];
    } ActionModleBlock:^(CGXAlertActionModel *actionModel) {
        actionModel.titleColor = [UIColor redColor];
    } SelectBlock:^(NSString *title, NSString *message, NSString *btnStr) {
        NSLog(@"%@--%@--%@",title,message,btnStr);
    }];
}



@end
