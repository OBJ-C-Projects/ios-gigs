//
//  Bearer.h
//  iOS Gigs
//
//  Created by FGT MAC on 8/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Bearer : NSObject

@property NSNumber *id;
@property NSString *token;
@property NSNumber *userID;

- (instancetype)initWIthID:(NSNumber *)id token:(NSString *)token userID:(NSNumber *)userID;

- (instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
