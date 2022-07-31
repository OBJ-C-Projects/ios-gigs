//
//  LoginViewController.h
//  iOS Gigs
//
//  Created by FGT MAC on 7/29/22.
//

#import <UIKit/UIKit.h>
#import<AuthenticationServices/AuthenticationServices.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController<ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding>

@end

NS_ASSUME_NONNULL_END
