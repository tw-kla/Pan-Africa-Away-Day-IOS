#import "TWRecord.h"

static NSDateFormatter *ADNRecordDateFormatter;

@implementation TWRecord

+ (NSDateFormatter *)dateFormatter {
    if (!ADNRecordDateFormatter) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
        ADNRecordDateFormatter = dateFormatter;
    }

    return ADNRecordDateFormatter;
}
@end
