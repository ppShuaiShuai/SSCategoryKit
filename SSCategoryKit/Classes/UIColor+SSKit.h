//
//  UIColor+SSKit.h
//  Pods-SSCategoryKit_Tests
//
//  Created by zhangshuai5 on 2021/8/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (SSKit)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexARGBString:(NSString *)inColorString;

+ (UIColor *)colorWithHex:(UInt32)hex;

+ (UIColor *)colorWithHex:(UInt32)hex alpha:(float)alpha;

- (NSUInteger)ARGBValue;

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
