//
//  SMTPAPI.h
//

#import <Foundation/Foundation.h>

@interface SMTPAPI : NSObject

@property (nonatomic, strong) NSMutableDictionary *header;
@property (nonatomic, strong) NSString *encodedHeader;

- (SMTPAPI *)addTo:(NSString *)to;
- (SMTPAPI *)addTos:(NSArray *)to;
- (SMTPAPI *)setTos:(NSArray *)to;
- (NSArray *)getTos;
- (SMTPAPI *)addSubstitution:(NSString *)key val:(NSString *)val;
- (SMTPAPI *)addSubstitutions:(NSString *)key val:(NSArray *)val;
- (SMTPAPI *)setSubstitutions:(NSMutableDictionary *)subs;
- (NSMutableDictionary *)getSubstitutions;
- (SMTPAPI *)addUniqueArg:(NSString *)key val:(NSString *)val;
- (SMTPAPI *)setUniqueArgs:(NSMutableDictionary *)args;
- (NSMutableDictionary *)getUniqueArgs;
- (SMTPAPI *)addCategory:(NSString *)val;
- (SMTPAPI *)addCategories:(NSMutableArray *)vals;
- (SMTPAPI *)setCategories:(NSMutableArray *)cat;
- (NSMutableArray *)getCategories;
- (SMTPAPI *)addSection:(NSString *)key val:(NSString *)val;
- (SMTPAPI *)setSections:(NSMutableDictionary *)sec;
- (NSMutableDictionary *)getSections;
- (SMTPAPI *)addFilter:(NSString *)filter setting:(NSString *)setting val:(NSString *)val;
- (SMTPAPI *)addFilter:(NSString *)filter settings:(NSString *)setting val:(int)val;
- (SMTPAPI *)setFilters:(NSMutableDictionary *)filters;
- (NSMutableDictionary *)getFilters;

- (NSString *)encodeHeader:(NSMutableDictionary *)header;
- (void)addCustomHeader:(id)value withKey:(id)key;
- (void)configureHeader;

@end
