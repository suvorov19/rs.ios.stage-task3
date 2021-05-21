#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {

    int count = 0;
    
    for (int i = 0; i < (int) ratingArray.count; i++) {
        for (int j = i; j < (int) ratingArray.count; j++) {
            for (int k = j; k < (int) ratingArray.count; k++) {
                if ([ratingArray[i] intValue] > [ratingArray[j] intValue] && [ratingArray[j] intValue] > [ratingArray[k] intValue]) {
                    count++;
                }
            }
        }
    }
    for (int i = (int)ratingArray.count - 1; i >= 0; i--) {
        for (int j = i; j >= 0; j--) {
            for (int k = j; k >= 0; k--) {
                if ([ratingArray[i] intValue] > [ratingArray[j] intValue] && [ratingArray[j] intValue] > [ratingArray[k] intValue]) {
                    count++;
                }
            }
        }
    }
    return count;
}
@end
