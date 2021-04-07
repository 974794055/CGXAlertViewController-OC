//
//  CGXAlertActionModel.h
//  CGXAlertVIewControllerDemo
//
//  Created by CGX on 2019/7/3.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGXAlertActionModel : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) UIFont *titleFont;
@property (nonatomic, copy) UIColor *titleColor;
@property (nonatomic, assign) UIAlertActionStyle style;

@end

NS_ASSUME_NONNULL_END
