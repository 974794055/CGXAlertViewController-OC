//
//  UIAlertController+CGXAlertColor.h
//  CGXAlertVIewControllerDemo
//
//  Created by MacMini-1 on 2019/7/3.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (CGXAlertColor)
@property (nonatomic,strong) UIColor *titleColor; /**< 标题的颜色 */
@property (nonatomic,strong) UIColor *messageColor; /**< 信息的颜色 */

@property (nonatomic,strong) UIFont *titleFont; /**< 标题的字体 */
@property (nonatomic,strong) UIFont *messageFont; /**< 信息的字体 */
@end

NS_ASSUME_NONNULL_END
