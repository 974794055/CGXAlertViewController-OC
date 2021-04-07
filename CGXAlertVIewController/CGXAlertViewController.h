//
//  CGXAlertViewController.h
//  CGXAppStructure
//
//  Created by CGX on 2017/6/21.
//  Copyright © 2017年 CGX. All rights reserved.
//
/**
下载链接：https://github.com/974794055/CGXAlertViewController-OC.git
QQ号：974794055
群名称：
群   号：
版本： 1.0.4
*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CGXAlertTitleModel.h"
#import "CGXAlertActionModel.h"


@class CGXAlertViewController;

// 标题配置block
typedef void(^CGXAlertViewControllerTitleBlock)(CGXAlertTitleModel *titleModel);
// 按钮点击事件block
typedef void(^CGXAlertViewControllerSelectBlock)(NSString *title ,NSString *message ,NSString *btnStr);
// 按钮配置block
typedef void(^CGXAlertViewControllerActionBlock)(CGXAlertActionModel *actionModel);

@interface CGXAlertViewController : NSObject


/*   无文本框 中间显示
 title:             标题
 message:           提示语
 buttonTitles:      按钮选项数组
 selectBlock:   按钮点击返回block
 */
#pragma mark - 样式选择  返回的有title   中间显示
+ (void)showAlertTitle:(NSString*)title
                   message:(NSString*)message
              ButTitles:(NSArray*)butTitles
                SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock;

+ (void)showAlertTitle:(NSString*)title
                   message:(NSString*)message
              ButTitles:(NSArray*)butTitles
                TitleBlock:(CGXAlertViewControllerTitleBlock)titleBlock
          ActionModleBlock:(CGXAlertViewControllerActionBlock)actionModleBlock
                SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock;
/*     无文本框 底部显示
 title:             标题
 message:           提示语
 buttonTitles:      按钮选项数组
 selectBlock:   按钮点击返回block
 */

#pragma mark - 样式选择  返回的有title
+ (void)showActionTitle:(NSString*)title
                   message:(NSString*)message
              ButTitles:(NSArray*)butTitles
               SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock;
+ (void)showActionTitle:(NSString*)title
                   message:(NSString*)message
              ButTitles:(NSArray*)butTitles
                TitleBlock:(CGXAlertViewControllerTitleBlock)titleBlock
          ActionModleBlock:(CGXAlertViewControllerActionBlock)actionModleBlock
               SelectBlock:(CGXAlertViewControllerSelectBlock)selectBlock;

@end
