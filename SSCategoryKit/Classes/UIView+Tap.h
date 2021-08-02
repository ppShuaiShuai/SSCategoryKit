//
//  UIView+Tap.h
//  SSCategoryKit
//
//  Created by zhangshuai on 2021/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Tap)

- (void)ss_AddTapWithAction:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END
