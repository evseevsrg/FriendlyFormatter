//
//  NSDate+FriendlyFormatter.m
//  FriendlyFormatter
//
//  Created by Sergey Evseev on 03/02/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "NSDate+FriendlyFormatter.h"

@implementation NSDate (FriendlyFormatter)

- (NSString *)friendlyFormat {
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    
    if ([self prefers24Hour])
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
    else
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSDate * todayMidnight = [gregorian dateFromComponents:components];
    
    // Today date
    if ([self timeIntervalSince1970] >= [todayMidnight timeIntervalSince1970]) {
        return [dateFormatter stringFromDate:self];
    }
    
    NSDate * yesterdayMidnight = [todayMidnight dateByAddingTimeInterval:-24 * 60 * 60];
    
    // Yesterday date
    if ([self timeIntervalSince1970] >= [yesterdayMidnight timeIntervalSince1970]) {
        return @"Yesterday";
    }
    
    NSTimeInterval timeSinceDate = [[NSDate date] timeIntervalSinceDate:self];
    
    // 5 days ago
    if (timeSinceDate < 24.0 * 60.0 * 60.0 * 5) {
        
        dateFormatter.dateFormat = @"EEEE";
        return [[dateFormatter stringFromDate:self] capitalizedString];
    }
    
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    return [dateFormatter stringFromDate:self];
    
}


- (BOOL)prefers24Hour {
    
    NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
    [dateComponent setHour:22];
    
    NSDate *testDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponent];
    static NSDateFormatter *formatter;
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeStyle: NSDateFormatterShortStyle];
    }
    NSString *testString = [formatter stringFromDate:testDate];
    return [[testString substringToIndex:1] isEqualToString:@"2"];
}


@end
