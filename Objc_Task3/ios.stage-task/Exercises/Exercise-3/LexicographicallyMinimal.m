#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *string1Mutable = [string1 mutableCopy];
    NSMutableString *string2Mutable = [string2 mutableCopy];
    NSMutableString *resultString = [NSMutableString string];
    
    while ((int)string1Mutable.length  + (int)string2Mutable.length  != 0) {
        
        if (string1Mutable.UTF8String[0] <= string2Mutable.UTF8String[0]) {
            [resultString appendString:[string1Mutable substringWithRange:NSMakeRange(0,1)]];
            [string1Mutable deleteCharactersInRange:NSMakeRange(0,1)];
        }
        else if (string1Mutable.UTF8String[0] >= string2Mutable.UTF8String[0]) {
            [resultString appendString:[string2Mutable substringWithRange:NSMakeRange(0,1)]];
            [string2Mutable deleteCharactersInRange:NSMakeRange(0,1)];
        }
        if ((int)string1Mutable.length == 0) {
            [resultString appendString:string2Mutable];
            [string2Mutable deleteCharactersInRange:NSMakeRange(0, string2Mutable.length)];
        }
        else if ((int)string2Mutable.length == 0) {
            [resultString appendString:string1Mutable];
            [string1Mutable deleteCharactersInRange:NSMakeRange(0, string1Mutable.length)];
        }
    }
    return resultString;
}
@end
