#import "TWHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation TWHTTPClient

+ (TWHTTPClient *)sharedClient {
    static TWHTTPClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://pa-kla-away-day.herokuapp.com/"]];
    });

    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }

    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];

    [self setParameterEncoding:AFFormURLParameterEncoding];

    [self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Content-Type" value:@"application/x-www-form-urlencoded"];

    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];

    return self;
}
@end
