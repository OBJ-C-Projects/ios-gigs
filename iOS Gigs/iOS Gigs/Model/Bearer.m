//
//  Bearer.m
//  iOS Gigs
//
//  Created by FGT MAC on 8/12/22.
//

#import "Bearer.h"

@implementation Bearer

- (instancetype)initWIthID:(NSNumber *)id token:(NSString *)token userID:(NSNumber *)userID {
    
    self = [super init];
    
    if (self) {
        _id = id;
        _token = token;
        _userID = userID;
    }
    
    return self;
}

- (instancetype)initWithDictionary: (NSDictionary *)dictionary {
    NSNumber *identifier = dictionary[@"id"];
    NSString *token = dictionary[@"token"];
    NSNumber *userID = dictionary[@"userId"];
    
    return [self initWIthID:identifier token:token userID: userID];
}


@end
