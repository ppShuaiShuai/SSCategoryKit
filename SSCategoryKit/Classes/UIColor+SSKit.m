//
//  UIColor+SSKit.m
//  Pods-SSCategoryKit_Tests
//
//  Created by zhangshuai5 on 2021/8/6.
//

#import "UIColor+SSKit.h"

@implementation UIColor (SSKit)

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    CGFloat red, blue, green;
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    red   = [self ss_colorComponentFrom:colorString start:0 length:2];
    green = [self ss_colorComponentFrom:colorString start:2 length:2];
    blue  = [self ss_colorComponentFrom:colorString start:4 length:2];
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString
{
    NSParameterAssert([hexString isKindOfClass:[NSString class]]);
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha = 0.f, red = 1.f, blue = 1.f, green = 1.f;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self ss_colorComponentFrom:colorString start:0 length:1];
            green = [self ss_colorComponentFrom:colorString start:1 length:1];
            blue  = [self ss_colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self ss_colorComponentFrom:colorString start:0 length:1];
            red   = [self ss_colorComponentFrom:colorString start:1 length:1];
            green = [self ss_colorComponentFrom:colorString start:2 length:1];
            blue  = [self ss_colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self ss_colorComponentFrom:colorString start:0 length:2];
            green = [self ss_colorComponentFrom:colorString start:2 length:2];
            blue  = [self ss_colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self ss_colorComponentFrom:colorString start:0 length:2];
            red   = [self ss_colorComponentFrom:colorString start:2 length:2];
            green = [self ss_colorComponentFrom:colorString start:4 length:2];
            blue  = [self ss_colorComponentFrom:colorString start:6 length:2];
            break;
        default:
//            NSAssert(NO, @"Color value %@ is invalid. It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB.", hexString);
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithHexARGBString:(NSString *)inColorString
{
    return [self colorWithHexString:inColorString];
}

+ (UIColor *)colorWithHex:(UInt32)hex
{
    return [UIColor colorWithHex:hex alpha:1];
}

+ (UIColor *)colorWithHex:(UInt32)hex alpha:(float)alpha
{
    CGFloat r = ((hex & 0xff0000) >> 16) / 255.f;
    CGFloat g = ((hex & 0x00ff00) >> 8) / 255.f;
    CGFloat b = (hex & 0x0000ff) / 255.f;
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

- (NSUInteger)ARGBValue
{
    CGFloat red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSUInteger value = ((NSUInteger)(alpha * 255) << 24) + ((NSUInteger)(red * 255) << 16) + ((NSUInteger)(green * 255) << 8) + (NSUInteger)(blue * 255);
    
    return value;
}

#pragma mark -
+ (CGFloat)ss_colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length
{
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = (length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring]);
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    return hexComponent / 255.f;
}


@end
