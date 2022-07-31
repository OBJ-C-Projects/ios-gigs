//
//  LoginViewController.m
//  iOS Gigs
//
//  Created by FGT MAC on 7/29/22.
//

#import "LoginViewController.h"
#import "GigsTextField.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self setupSubViews];
}

- (void)setupSubViews {
    //1.Create Stack View
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 10;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentCenter;
    
    [self.view addSubview:stackView];

    [[stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor] setActive:YES];
    [[stackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16] setActive:YES];
    [[stackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16] setActive:YES];

    //2.Create a text field for user name
    GigsTextField *topTextField = [[GigsTextField alloc] init];
    topTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [stackView addArrangedSubview:topTextField];
    
    [[topTextField.leadingAnchor constraintEqualToAnchor:stackView.leadingAnchor] setActive:YES];
    [[topTextField.trailingAnchor constraintEqualToAnchor:stackView.trailingAnchor] setActive:YES];
    [[topTextField.heightAnchor constraintEqualToConstant:32] setActive:YES];
    [topTextField setRightPadding:8];
    [topTextField setLeftPadding:8];
    
    [topTextField setPlaceholder:@"User Name"];
    topTextField.backgroundColor = UIColor.whiteColor;
    
    //3.Create a text field for password
    GigsTextField *bottomTextField = [[GigsTextField alloc] init];
    bottomTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [stackView addArrangedSubview:bottomTextField];
    
    [[bottomTextField.leadingAnchor constraintEqualToAnchor:topTextField.leadingAnchor] setActive:YES];
    [[bottomTextField.trailingAnchor constraintEqualToAnchor:topTextField.trailingAnchor] setActive:YES];
    [[bottomTextField.heightAnchor constraintEqualToAnchor:topTextField.heightAnchor] setActive:YES];
    [bottomTextField setRightPadding:8];
    [bottomTextField setLeftPadding:8];
    
    [bottomTextField setPlaceholder:@"Password"];
    bottomTextField.backgroundColor = UIColor.whiteColor;
    
    //1.Create Stack View for buttons
    UIStackView *buttonsStackView = [[UIStackView alloc] init];
    buttonsStackView.translatesAutoresizingMaskIntoConstraints = NO;
    buttonsStackView.axis = UILayoutConstraintAxisVertical;
    buttonsStackView.spacing = 10;
    buttonsStackView.distribution = UIStackViewDistributionFill;
    buttonsStackView.alignment = UIStackViewAlignmentCenter;
    
    [self.view addSubview:buttonsStackView];

    [[buttonsStackView.topAnchor constraintEqualToAnchor:stackView.bottomAnchor constant:40] setActive:YES];
    [[buttonsStackView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:16] setActive:YES];
    [[buttonsStackView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-16] setActive:YES];
    
    
    //3.Create a sign in/up button
    UIButton *signInButton = [[UIButton alloc] init];
    signInButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [buttonsStackView addArrangedSubview:signInButton];
    
    [[signInButton.leadingAnchor constraintEqualToAnchor:buttonsStackView.leadingAnchor constant:48] setActive:YES];
    [[signInButton.trailingAnchor constraintEqualToAnchor:buttonsStackView.trailingAnchor constant:-48] setActive:YES];

    signInButton.backgroundColor = UIColor.whiteColor;
    [signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
    [signInButton setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    signInButton.layer.cornerRadius = 8;
    
    
    //4. SiwA button
    ASAuthorizationAppleIDButton *siwaButton = [[ASAuthorizationAppleIDButton alloc] init];
    [siwaButton addTarget:self action:@selector(handleAuthorizationAppleIDButtonPress) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonsStackView addArrangedSubview:siwaButton];

    [[siwaButton.heightAnchor constraintEqualToAnchor:signInButton.heightAnchor] setActive:YES];
    [[siwaButton.leadingAnchor constraintEqualToAnchor:signInButton.leadingAnchor] setActive:YES];
    [[siwaButton.trailingAnchor constraintEqualToAnchor:signInButton.trailingAnchor] setActive:YES];
}

- (void)handleAuthorizationAppleIDButtonPress{
    ASAuthorizationAppleIDProvider *appleIDProvider = [[ASAuthorizationAppleIDProvider alloc] init];
    ASAuthorizationAppleIDRequest *request = [appleIDProvider createRequest];
    request.requestedScopes =  @[ASAuthorizationScopeFullName, ASAuthorizationScopeEmail];
    
    ASAuthorizationController *authController = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
    authController.delegate = self;
    authController.presentationContextProvider = self;
    [authController performRequests];
}

@end
