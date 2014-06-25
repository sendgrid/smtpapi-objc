//
//  SMTPAPI.h
//

#import <Foundation/Foundation.h>

@interface SMTPAPI : NSObject

@property (nonatomic, strong) NSMutableDictionary *header;

- (NSString *)headerEncode:(NSDictionary *)header;
- (void)addCustomHeader:(id)value withKey:(id)key;
- (void)configureHeader;

@end
