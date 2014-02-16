#import "AFHTTPClient.h"

@interface TWHTTPClient : AFHTTPClient
+ (TWHTTPClient *)sharedClient;
@end
