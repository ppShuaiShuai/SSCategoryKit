//
//  NSString+SSKit.m
//  SSCategoryKit
//
//  Created by zhangshuai5 on 2021/8/6.
//

#import "NSString+SSKit.h"

@implementation NSString (SSKit)


@end

/// Size Category
@implementation NSString (Size)

- (CGFloat)heightForMaxSize:(CGSize)maxSize font:(UIFont *)font{
    if (self.length == 0) {
        return 0.f;
    }
    return [self sizeForMaxSize:maxSize font:font].height;
}

- (CGFloat)widthForMaxSize:(CGSize)maxSize font:(UIFont *)font{
    if (self.length == 0) {
        return 0.f;
    }
    return [self sizeForMaxSize:maxSize font:font].width;
}

- (CGSize)sizeForMaxSize:(CGSize)maxSize font:(UIFont *)font{
    if (self.length == 0) {
        return CGSizeMake(0.f, 0.f);
    }
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end
