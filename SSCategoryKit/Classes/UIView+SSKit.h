//
//  UIView+SSKit.h
//  SSCategoryKit
//
//  Created by zhangshuai on 2021/6/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SSKit)

@end

/// Tap Category
@interface UIView (Tap)

- (void)ss_AddTapWithAction:(void(^)(void))block;

@end


/// Screen Category
@interface UIView (Screen)

+ (CGFloat)ss_screenWidth;

+ (CGFloat)ss_screenHeight;

+ (CGFloat)ss_widthScale;

@end


/// Size Category
@interface UIView (Size)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic, readonly) CGFloat ttScreenX;

@property (nonatomic, readonly) CGFloat ttScreenY;

@property (nonatomic, readonly) CGFloat screenViewX;

@property (nonatomic, readonly) CGFloat screenViewY;

@property (nonatomic, readonly) CGRect screenFrame;

@property (nonatomic) CGPoint origin;

@property (nonatomic, readonly) CGPoint boundsCenter;

@property (nonatomic) CGSize size;

@end


/// View ViewController Category
@interface UIView (VC)

- (UIView *)descendantOrSelfWithClass:(Class)cls;

- (UIView *)ancestorOrSelfWithClass:(Class)cls;

- (void)removeAllSubviews;

- (UIViewController*)viewController;

@end

NS_ASSUME_NONNULL_END
