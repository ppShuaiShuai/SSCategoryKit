//
//  NSString+SSKit.h
//  SSCategoryKit
//
//  Created by zhangshuai5 on 2021/8/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SSKit)

@end


/// Size Category
@interface NSString (Size)

- (CGFloat)heightForMaxSize:(CGSize)maxSize font:(UIFont *)font;

- (CGFloat)widthForMaxSize:(CGSize)maxSize font:(UIFont *)font;

- (CGSize)sizeForMaxSize:(CGSize)maxSize font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
