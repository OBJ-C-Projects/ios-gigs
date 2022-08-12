//
//  User.m
//  iOS Gigs
//
//  Created by FGT MAC on 8/9/22.
//

#import "User.h"

@implementation User

- (instancetype)initWithUserName:(NSString *)username password:(NSString *)password {
    
    self = [super init];
    
    if (self) {
        _username = username;
        _password = password;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *username = dictionary[@"username"];
    NSString *password = dictionary[@"password"];
    
    return [self initWithUserName:username password:password];
}

@end
