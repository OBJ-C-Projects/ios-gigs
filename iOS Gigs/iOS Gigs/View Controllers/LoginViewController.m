//
//  LoginViewController.m
//  iOS Gigs
//
//  Created by FGT MAC on 7/29/22.
//

#import "LoginViewController.h"
#import "GigsTextField.h"

@interface LoginViewController ()
@property UIStackView *middleStackView;
@property UIButton *signInButton;
@property UISegmentedControl *segmentedConteller;
@end

@implementation LoginViewController

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.purpleColor;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self setupSubViews];
}

#pragma mark - Setup subviews
- (void)setupSubViews {
    [self setupTopStackView];
    [self setupMiddleStackView];
    [self setupBottomStackView];
}

- (void)setupTopStackView{
    //1.Create Stack View for buttons
    UIStackView *topStackView = [[UIStackView alloc] init];
    topStackView.translatesAutoresizingMaskIntoConstraints = NO;
    topStackView.axis = UILayoutConstraintAxisVertical;
    topStackView.spacing = 50;
    topStackView.distribution = UIStackViewDistributionFill;
    topStackView.alignment = UIStackViewAlignmentCenter;
    
    [self.view addSubview:topStackView];

    [[topStackView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:40] setActive:YES];
    [[topStackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16] setActive:YES];
    [[topStackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16] setActive:YES];
    
    //2.Segmented controller
    _segmentedConteller = [[UISegmentedControl alloc] initWithItems:@[@"Sign in",@"Sign up"]];
    _segmentedConteller.backgroundColor = UIColor.whiteColor;
    _segmentedConteller.selectedSegmentIndex = 0;
    [_segmentedConteller addTarget:self action:@selector(segmentedControllerChanged:) forControlEvents:UIControlEventValueChanged];
    
    [topStackView addArrangedSubview:_segmentedConteller];
    
    //3.App name label
    UILabel *appName = [[UILabel alloc] init];
    appName.text = @"Gigs";
    appName.textColor = UIColor.whiteColor;
    [appName setFont:[UIFont fontWithName:@"ArialRoundedMTBold" size:44.0]];
    
    [topStackView addArrangedSubview:appName];
}

- (void)setupMiddleStackView{
    //1.Create Stack View
    _middleStackView = [[UIStackView alloc] init];
    _middleStackView.translatesAutoresizingMaskIntoConstraints = NO;
    _middleStackView.axis = UILayoutConstraintAxisVertical;
    _middleStackView.spacing = 10;
    _middleStackView.distribution = UIStackViewDistributionFill;
    _middleStackView.alignment = UIStackViewAlignmentCenter;
    
    [self.view addSubview:_middleStackView];

    [[_middleStackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[_middleStackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16] setActive:YES];
    [[_middleStackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16] setActive:YES];

    //2.Create a text field for user name
    GigsTextField *topTextField = [[GigsTextField alloc] init];
    topTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_middleStackView addArrangedSubview:topTextField];
    
    [[topTextField.leadingAnchor constraintEqualToAnchor:_middleStackView.leadingAnchor] setActive:YES];
    [[topTextField.trailingAnchor constraintEqualToAnchor:_middleStackView.trailingAnchor] setActive:YES];
    [[topTextField.heightAnchor constraintEqualToConstant:32] setActive:YES];
    [topTextField setRightPadding:8];
    [topTextField setLeftPadding:8];
    
    [topTextField setPlaceholder:@"User Name"];
    topTextField.backgroundColor = UIColor.whiteColor;
    topTextField.textContentType = UITextContentTypeUsername;
    topTextField.layer.cornerRadius = 8.0;
    
    //3.Create a text field for password
    GigsTextField *bottomTextField = [[GigsTextField alloc] init];
    bottomTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_middleStackView addArrangedSubview:bottomTextField];
    
    [[bottomTextField.leadingAnchor constraintEqualToAnchor:topTextField.leadingAnchor] setActive:YES];
    [[bottomTextField.trailingAnchor constraintEqualToAnchor:topTextField.trailingAnchor] setActive:YES];
    [[bottomTextField.heightAnchor constraintEqualToAnchor:topTextField.heightAnchor] setActive:YES];
    [bottomTextField setRightPadding:8];
    [bottomTextField setLeftPadding:8];
    
    [bottomTextField setPlaceholder:@"Password"];
    bottomTextField.backgroundColor = UIColor.whiteColor;
    bottomTextField.textContentType =  UITextContentTypePassword;
    bottomTextField.layer.cornerRadius = 8.0;
    
}

- (void)setupBottomStackView{
    //1.Create Stack View for buttons
    UIStackView *buttomStackView = [[UIStackView alloc] init];
    buttomStackView.translatesAutoresizingMaskIntoConstraints = NO;
    buttomStackView.axis = UILayoutConstraintAxisVertical;
    buttomStackView.spacing = 10;
    buttomStackView.distribution = UIStackViewDistributionFill;
    buttomStackView.alignment = UIStackViewAlignmentCenter;
    
    [self.view addSubview:buttomStackView];

    [[buttomStackView.topAnchor constraintEqualToAnchor:_middleStackView.bottomAnchor constant:40] setActive:YES];
    [[buttomStackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16] setActive:YES];
    [[buttomStackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16] setActive:YES];
    
    
    //3.Create a sign in/up button
    _signInButton = [[UIButton alloc] init];
    _signInButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [buttomStackView addArrangedSubview:_signInButton];
    
    [[_signInButton.leadingAnchor constraintEqualToAnchor:buttomStackView.leadingAnchor constant:48] setActive:YES];
    [[_signInButton.trailingAnchor constraintEqualToAnchor:buttomStackView.trailingAnchor constant:-48] setActive:YES];

    _signInButton.backgroundColor = UIColor.whiteColor;
    [_signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
    [_signInButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_signInButton setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];
    _signInButton.layer.cornerRadius = 8;
    
    
    //4. SiwA button
    ASAuthorizationAppleIDButton *siwaButton = [[ASAuthorizationAppleIDButton alloc] init];
    [siwaButton addTarget:self action:@selector(handleAuthorizationAppleIDButtonPress) forControlEvents:UIControlEventTouchUpInside];
    
    [buttomStackView addArrangedSubview:siwaButton];

    [[siwaButton.heightAnchor constraintEqualToAnchor:_signInButton.heightAnchor] setActive:YES];
    [[siwaButton.leadingAnchor constraintEqualToAnchor:_signInButton.leadingAnchor] setActive:YES];
    [[siwaButton.trailingAnchor constraintEqualToAnchor:_signInButton.trailingAnchor] setActive:YES];
}

#pragma mark - Actions
- (void)handleAuthorizationAppleIDButtonPress{
    ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc] init];
    ASAuthorizationAppleIDRequest *request = [appleIDProvider createRequest];
    request.requestedScopes =  @[ASAuthorizationScopeFullName, ASAuthorizationScopeEmail];
    
    ASAuthorizationController *authController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
    authController.delegate = self;
    authController.presentationContextProvider = self;
    [authController performRequests];
}

-(void)segmentedControllerChanged:(UISegmentedControl*)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:
            [_signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
            break;
        case 1:
            [_signInButton setTitle:@"Sign up" forState:UIControlStateNormal];
        default:
            break;
    }
    
}

#pragma mark - ASAuthorizationControllerDelegate

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization{
    
    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        ASAuthorizationAppleIDCredential *appleIDCredential = authorization.credential;
        
//        NSPersonNameComponents *userName = appleIDCredential.fullName;
//        NSString *email = appleIDCredential.email;
        
        
        
        
    }else if ([authorization.credential isKindOfClass:[ASPasswordCredential class]]){
        ASPasswordCredential *passwordCredential = authorization.credential;
        
//        NSString *userName = passwordCredential.user;
//        NSString *email = passwordCredential.password;
    }
}

#pragma mark - ASAuthorizationControllerPresentationContextProviding

- (ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller{
    return self.view.window;
}

@end
