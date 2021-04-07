//
//  CGXAlertTitleModel.h
//  CGXAlertVIewControllerDemo
//
//  Created by CGX on 2019/8/5.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGXAlertTitleModel : NSObject

@property (nonatomic,strong) UIColor *titleColor; /**< 标题的颜色 */
@property (nonatomic,strong) UIColor *messageColor; /**< 信息的颜色 */

@property (nonatomic,strong) UIFont *titleFont; /**< 标题的字体 */
@property (nonatomic,strong) UIFont *messageFont; /**< 信息的字体 */

@end

NS_ASSUME_NONNULL_END
