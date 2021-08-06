//
//  NSDateFormatter+SSKit.h
//  SSCategoryKit
//
//  Created by zhangshuai on 2021/6/4.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (SSKit)

/// 日期转字符串
+ (NSString *)ss_stringFromDate:(NSDate *)date
                     dateFormat:(NSString *)dateFormat;

+ (NSString *)ss_stringFromDate:(NSDate *)date
                     dateFormat:(NSString *)dateFormat
                       timeZone:(NSTimeZone *)timeZone;

/// 字符串转日期
+ (NSDate *)ss_dateFromString:(NSString *)dateString
                   dateFormat:(NSString *)dateFormat;

+ (NSDate *)ss_dateFromString:(NSString *)dateString
                   dateFormat:(NSString *)dateFormat
                     timeZone:(NSTimeZone *)timeZone;

/// 格式化字符串转化为另一种日期格式
+ (NSString *)ss_dateStringWithString:(NSString *)dateString
                           fromFormat:(NSString *)dateFormat
                             toFormat:(NSString *)newFormat;

+ (NSDateFormatter *)ss_dateFormatter:(NSString *)dateFormat
                             timeZone:(NSTimeZone *)timeZone;

@end
