//
//  NSDateFormatter+SSKit.m
//  SSCategoryKit
//
//  Created by zhangshuai on 2021/6/4.
//

#import "NSDateFormatter+SSKit.h"

@implementation NSDateFormatter (SSKit)

+ (dispatch_queue_t)ss_formatQueue
{
    static dispatch_once_t onceToken;
    static dispatch_queue_t formatQueue = nil;
    dispatch_once(&onceToken, ^{
        formatQueue = dispatch_queue_create("SSCategoryKit.dayFormat", DISPATCH_QUEUE_CONCURRENT);
    });
    return formatQueue;
}

+ (NSMutableDictionary *)ss_dateFormatterDict
{
    static NSMutableDictionary *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [NSMutableDictionary dictionary];
    });
    return cache;
}

+ (NSDateFormatter *)ss_dateFormatterWithFormat:(NSString *)dateFormat
{
    __block NSDateFormatter *dateFormatter = nil;
    dispatch_sync([self ss_formatQueue], ^{
        dateFormatter = [self ss_dateFormatterDict][dateFormat];
    });
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        dateFormatter.dateFormat = dateFormat;
        dispatch_barrier_async([self ss_formatQueue], ^{
            [self ss_dateFormatterDict][dateFormat] = dateFormatter;
        });
    }
    return dateFormatter;
}

+ (NSString *)ss_stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat
{
    return [self ss_stringFromDate:date dateFormat:dateFormat timeZone:nil];
}

+ (NSString *)ss_stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat timeZone:(NSTimeZone *)timeZone
{
    if (![date isKindOfClass:[NSDate class]]
        || ![dateFormat isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [[self ss_dateFormatter:dateFormat timeZone:timeZone] stringFromDate:date];
}

+ (NSDate *)ss_dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat
{
    return [self ss_dateFromString:dateString dateFormat:dateFormat timeZone:nil];
}

+ (NSDate *)ss_dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat timeZone:(NSTimeZone *)timeZone
{
    if (![dateString isKindOfClass:[NSString class]]
        || ![dateFormat isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [[self ss_dateFormatter:dateFormat timeZone:timeZone] dateFromString:dateString];
}


+ (NSString *)ss_dateStringWithString:(NSString *)dateString fromFormat:(NSString *)dateFormat toFormat:(NSString *)newFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSDate *desDate = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:newFormat];
    NSString *newDateString = [dateFormatter stringFromDate:desDate];
    return newDateString;
}

+ (NSDateFormatter *)ss_dateFormatter:(NSString *)dateFormat timeZone:(NSTimeZone *)timeZone
{
    if (![dateFormat isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [self ss_dateFormatterWithFormat:dateFormat];
    if (timeZone && ![dateFormatter.timeZone isEqualToTimeZone:timeZone]) {
        [dateFormatter setTimeZone:timeZone];
    }
    return dateFormatter;
}

@end
