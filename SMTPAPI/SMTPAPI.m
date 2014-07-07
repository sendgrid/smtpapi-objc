//
//  SMTPAPI.m
//

#import "SMTPAPI.h"

@interface SMTPAPI ()

@property (strong, nonatomic) NSString *baseURL;

@end

@implementation SMTPAPI

- (id)init
{
    self = [super init];
    if (self)
    {
        self.header = [[NSMutableDictionary alloc] init];
        self.encodedHeader = [[NSString alloc] init];
    }
    return self;
}

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

- (SMTPAPI *)addSubstitution:(NSString *)key val:(NSString *)val
{
    NSMutableDictionary *sub = [self.header objectForKey:@"sub"];
    if (sub == NULL)
    {
        sub = [[NSMutableDictionary alloc] init];
    }
    
    NSMutableArray *values = [sub objectForKey:key];
    if (values == NULL)
    {
        values = [[NSMutableArray alloc] init];
    }
    
    [values addObject:val];
    [sub setObject:values forKey:key];
    
    [self.header setObject:sub forKey:@"sub"];
    
    return self;
}

- (SMTPAPI *)addSubstitutions:(NSString *)key val:(NSArray *)val
{
    for (int i = 0; i < [val count]; i++) {
        [self addSubstitution:key val:val[i]];
    }
    return self;
}

- (SMTPAPI *)setSubstitutions:(NSMutableDictionary *)subs
{
    [self.header setObject:subs forKey:@"sub"];
    return self;
}

- (NSMutableDictionary *)getSubstitutions
{
    return [self.header objectForKey:@"sub"];
}

- (SMTPAPI *)addUniqueArg:(NSString *)key val:(NSString *)val
{
    if ([self.header objectForKey:@"unique_args"] == NULL)
    {
        NSMutableDictionary *uniqueArguments = [[NSMutableDictionary alloc] init];
        [self.header setObject:uniqueArguments forKey:@"unique_args"];
    }
    
    NSMutableDictionary *uniqueArguments = [self.header objectForKey:@"unique_args"];
    [uniqueArguments setObject:val forKey:key];
    [self.header setObject:uniqueArguments forKey:@"unique_args"];
    
    return self;
}

- (SMTPAPI *)setUniqueArgs:(NSMutableDictionary *)args
{
    [self.header setObject:args forKey:@"unique_args"];
    return self;
}

- (NSMutableDictionary *)getUniqueArgs {
    return [self.header objectForKey:@"unique_args"];
}

- (SMTPAPI *)addCategory:(NSString *)val {
    NSMutableArray *categories = [self.header objectForKey:@"category"];
    if(categories == NULL) {
        categories = [[NSMutableArray alloc] init];
    }
    [categories addObject:val];
    [self.header setObject:categories forKey:@"category"];
    return self;
}

- (SMTPAPI *)addCategories:(NSMutableArray *)vals {
    for (int i = 0; i < vals.count; i++) {
        [self addCategory:[vals objectAtIndex:i]];
    }
    return self;
}

- (SMTPAPI *)setCategories:(NSMutableArray *)cat {
    [self.header setObject:@"category" forKey:cat];
    return self;
}

- (NSMutableArray *)getCategories {
    return [self.header objectForKey:@"category"];
}

- (SMTPAPI *)addSection:(NSString *)key val:(NSString *)val {
    NSMutableDictionary *sections = [self.header objectForKey:@"section"];
    if (sections == NULL) {
        sections = [[NSMutableDictionary alloc] init];
    }
    
    [sections setObject:val forKey:key];
    [self.header setObject:sections forKey:@"section"];
    
    return self;
}

- (SMTPAPI *)setSections:(NSMutableDictionary *)sec {
    [self.header setObject:@"section" forKey:sec];
    return self;
}

- (NSMutableDictionary *)getSections {
    return [self.header objectForKey:@"section"];
}

- (SMTPAPI *)addFilter:(NSString *)filter setting:(NSString *)setting val:(NSString *)val {
    NSMutableDictionary *filters = [self.header objectForKey:@"filters"];
    if (filters == NULL) {
        filters = [[NSMutableDictionary alloc] init];
    }
    NSMutableDictionary *filterDictionary = [filters objectForKey:filter];
    if (filterDictionary == NULL) {
        filterDictionary = [[NSMutableDictionary alloc] init];
    }
    NSMutableDictionary *settingsDictionary = [filterDictionary objectForKey:@"settings"];
    if(settingsDictionary == NULL) {
        settingsDictionary = [[NSMutableDictionary alloc] init];
    }
    [settingsDictionary setObject:val forKey:setting];
    [filterDictionary setObject:settingsDictionary forKey:@"settings"];
    [filters setObject:filterDictionary forKey:filter];
    [self.header setObject:filters forKey:@"filters"];
    return self;
}

- (SMTPAPI *)addFilter:(NSString *)filter settings:(NSString *)setting val:(int)val {
    NSMutableDictionary *filters = [self.header objectForKey:@"filters"];
    if (filters == NULL) {
        filters = [[NSMutableDictionary alloc] init];
    }
    NSMutableDictionary *filterDictionary = [filters objectForKey:filter];
    if (filterDictionary == NULL) {
        filterDictionary = [[NSMutableDictionary alloc] init];
    }
    NSMutableDictionary *settingsDictionary = [filterDictionary objectForKey:@"settings"];
    if(settingsDictionary == NULL) {
        settingsDictionary = [[NSMutableDictionary alloc] init];
    }
    [settingsDictionary setObject:[NSNumber numberWithInt:val] forKey:setting];
    [filterDictionary setObject:settingsDictionary forKey:@"settings"];
    [filters setObject:filterDictionary forKey:filter];
    [self.header setObject:filters forKey:@"filters"];
    return self;
}

- (SMTPAPI *)setFilters:(NSMutableDictionary *)filters {
    [self.header setObject:filters forKey:@"fiters"];
    return self;
}

- (NSMutableDictionary *)getFilters {
    return [self.header objectForKey:@"filters"];
}

#pragma mark - Header Methods

- (void)addCustomHeader:(id)value withKey:(id)key
{
    [self.header setObject:value forKey:key];
}

- (void)configureHeader
{
    if (self.header != nil)
        self.encodedHeader = [self encodeHeader:self.header];
}

- (NSString *)encodeHeader:(NSMutableDictionary *)header
{
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
