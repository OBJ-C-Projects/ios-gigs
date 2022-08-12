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
@property GigsTextField *topTextField;
@property GigsTextField *bottomTextField;

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
    _topTextField = [[GigsTextField alloc] init];
    _topTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_middleStackView addArrangedSubview:_topTextField];
    
    [[_topTextField.leadingAnchor constraintEqualToAnchor:_middleStackView.leadingAnchor] setActive:YES];
    [[_topTextField.trailingAnchor constraintEqualToAnchor:_middleStackView.trailingAnchor] setActive:YES];
    [[_topTextField.heightAnchor constraintEqualToConstant:32] setActive:YES];
    [_topTextField setRightPadding:8];
    [_topTextField setLeftPadding:8];
    
    [_topTextField setPlaceholder:@"User Name"];
    _topTextField.backgroundColor = UIColor.whiteColor;
    _topTextField.textContentType = UITextContentTypeUsername;
    _topTextField.layer.cornerRadius = 8.0;
    
    //3.Create a text field for password
    _bottomTextField = [[GigsTextField alloc] init];
    _bottomTextField.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_middleStackView addArrangedSubview:_bottomTextField];
    
    [[_bottomTextField.leadingAnchor constraintEqualToAnchor:_topTextField.leadingAnchor] setActive:YES];
    [[_bottomTextField.trailingAnchor constraintEqualToAnchor:_topTextField.trailingAnchor] setActive:YES];
    [[_bottomTextField.heightAnchor constraintEqualToAnchor:_topTextField.heightAnchor] setActive:YES];
    [_bottomTextField setRightPadding:8];
    [_bottomTextField setLeftPadding:8];
    
    [_bottomTextField setPlaceholder:@"Password"];
    _bottomTextField.backgroundColor = UIColor.whiteColor;
    _bottomTextField.textContentType =  UITextContentTypePassword;
    _bottomTextField.layer.cornerRadius = 8.0;
    
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
    [_signInButton addTarget:self action:@selector(handleNormalAuthorizationButtonPress) forControlEvents:UIControlEventTouchUpInside];
    
    
    //4. SiwA button
    ASAuthorizationAppleIDButton *siwaButton = [[ASAuthorizationAppleIDButton alloc] init];
    [siwaButton addTarget:self action:@selector(handleAuthorizationAppleIDButtonPress) forControlEvents:UIControlEventTouchUpInside];
    
    [buttomStackView addArrangedSubview:siwaButton];

    [[siwaButton.heightAnchor constraintEqualToAnchor:_signInButton.heightAnchor] setActive:YES];
    [[siwaButton.leadingAnchor constraintEqualToAnchor:_signInButton.leadingAnchor] setActive:YES];
    [[siwaButton.trailingAnchor constraintEqualToAnchor:_signInButton.trailingAnchor] setActive:YES];
}

#pragma mark - Actions

- (void)handleNormalAuthorizationButtonPress{
    
    if (_bottomTextField.text.length > 0 && _topTextField.text.length > 0) {
        NSLog(@"✅Clicked sign in");
    }else{
        NSLog(@"❌Text field must not be empty!");
    }
    
    
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
