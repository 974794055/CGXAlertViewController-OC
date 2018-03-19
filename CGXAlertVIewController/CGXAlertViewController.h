//
//  CGXAlertViewController.h
//  CGXAppStructure
//
//  Created by 曹贵鑫 on 2017/6/21.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CGXAlertViewControllerContentStyle) {
    CGXAlertViewControllerContentBtn, //中间显示
    CGXAlertViewControllerContentTextBox   //文本框输入
};

@interface CGXAlertViewController : NSObject


//样式选择
@property (nonatomic, assign) CGXAlertViewControllerContentStyle contentStyle;

/*   无文本框
 title:             标题
 message:           提示语
 buttonTitles:      按钮选项数组
 completionBlock:   按钮点击返回block
 vc:                返回控制器
 */
#pragma mark - 样式选择  返回的有title   中间显示
+ (void)showAlertViewStyleWithTitle:(NSString*)title message:(NSString*)message buttonTitles:(NSArray*)buttonTitles titleBlock:(void(^)(NSString *titleStr ,NSString *messageStr ,NSString *btntitleStr))titleBlock showViewController:(UIViewController*)vc;

#pragma mark - 样式选择  返回的有title
+ (void)showAlertViewStyleWithTitle:(NSString*)title message:(NSString*)message buttonTitles:(NSArray*)buttonTitles titleBlock:(void(^)(NSString *titleStr ,NSString *messageStr ,NSString *btntitleStr))titleBlock showViewController:(UIViewController*)vc preferredStyle:(UIAlertControllerStyle)style;
@end
