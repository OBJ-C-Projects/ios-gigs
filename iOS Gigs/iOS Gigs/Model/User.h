//
//  User.h
//  iOS Gigs
//
//  Created by FGT MAC on 8/9/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property NSString *username;
@property NSString *password;

- (instancetype)initWithUserName:(NSString *)username password:(NSString *)password;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
