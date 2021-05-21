#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSArray *monthArray = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July" @"August", @"September", @"October", @"November", @"December"];
    for (int i = 1; i <= 12; i++ ) {
        if (monthNumber == i) {
            NSString *actualResult = monthArray[i-1];
            return actualResult;
        }
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter *dateFormatter = ([NSDateFormatter new]);
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSDate *dateFromInputString = [dateFormatter dateFromString:date];
    
    [dateFormatter setDateFormat:@"dd"];
    NSString *actualResult = [dateFormatter stringFromDate:dateFromInputString];
    
    return actualResult.longLongValue;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru"];
    [dateFormatter setDateFormat:@"EEE"];
    
    NSString *weekDay = [dateFormatter stringFromDate: date];
    
    return weekDay;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = ([NSDateFormatter new]);
    dateFormatter.dateFormat = @"dd.MM.yyyy";
    
    NSString *weekBeginingString = @"17.05.2021";
    NSDate *weekBeginingDate = [dateFormatter dateFromString:weekBeginingString];
    
    NSString *weekEndingString = @"23.05.2021";
    NSDate *weekEndingDate = [dateFormatter dateFromString:weekEndingString];
    
    
    if (weekBeginingDate < date && weekEndingDate > date) {
        return YES;
    }
    return NO;
}

@end
