//
//  SMTPAPI.m
//

#import "SMTPAPI.h"

@interface SMTPAPI ()

@property (strong, nonatomic) NSString *baseURL;

@end

@implementation SMTPAPI

- (id)init:(NSMutableDictionary*)header
{
    self = [super init];
    if (self)
    {
        self.header = header;
    }
    return self;
}

- (SMTPAPI *)addTo:(NSString *)to
{
    NSMutableArray* toList = [self.header objectForKey:@"to"];
    if (toList == NULL)
        toList = [[NSMutableArray alloc] init];
    
    [toList addObject:to];
    [self.header setObject:toList forKey:@"to"];
    return self;
}

- (SMTPAPI *)addTos:(NSArray *)to
{
    for(int i = 0; i < [to count]; i ++) {
        [self addTo:to[i]];
    }
    return self;
}

- (SMTPAPI *)setTos:(NSArray *)to
{
    [self.header setObject:to forKey:@"to"];
    return self;
}

- (NSArray *)getTos
{
    return [self.header objectForKey:@"to"];
}

- (SMTPAPI *)addSubstitution:(NSString *)key val:(NSString *) val
{
    if ([self.header objectForKey:@"sub"] == NULL)
    {
        NSMutableDictionary *sub = [[NSMutableDictionary alloc] init];
        [self.header setObject:sub forKey:@"sub"];
    }
    NSMutableDictionary *sub = [self.header objectForKey:@"sub"];
    
    [sub setObject:val forKey:key];
    
    [self.header setObject:sub forKey:@"sub"];
    
    return self;
}

- (SMTPAPI *)addSubstitutions:(NSString *)key val:(NSArray *) val
{
    for (int i = 0; i < [val count]; i++) {
        [self addSubstitution:key val:val[i]];
    }
    return self;
}

#pragma mark - Header Methods

- (void)addCustomHeader:(id)value withKey:(id)key
{
    [self.header setObject:value forKey:key];
}

- (void)configureHeader
{
//    if (self.toList != nil)
//    {
//        [self.header setObject:self.toList forKey:@"to"];
//        self.to = [self.toList objectAtIndex:0];
//    }
    
    
//    if (self.header != nil)
//        self.xsmtpapi = [self headerEncode:self.header];
}

- (NSString *)headerEncode:(NSMutableDictionary *)header
{
    //Converts NSDictionary of Header arguments to JSON string
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:header
                                                       options:0
                                                         error:&error];
    NSString *JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
    
    if (!jsonData)
        NSLog(@"JSON error: %@", error);
    
    return JSONString;
}

@end
