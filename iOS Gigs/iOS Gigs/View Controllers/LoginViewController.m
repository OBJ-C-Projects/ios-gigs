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
//    stackView.alignment = UIStackViewAlignmentCenter;
    
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
    
    
    //3.Create a sign in/up button
    UIButton *signInButton = [[UIButton alloc] init];
    signInButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [stackView addArrangedSubview:signInButton];
    
//    [[signInButton.topAnchor constraintEqualToAnchor:bottomTextField.bottomAnchor constant:50]setActive:YES];
//    [[signInButton.leadingAnchor constraintEqualToAnchor:stackView.leadingAnchor constant:32] setActive:YES];
//    [[signInButton.trailingAnchor constraintEqualToAnchor:stackView.trailingAnchor constant:-32] setActive:YES];

    signInButton.backgroundColor = UIColor.whiteColor;
    [signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
    [signInButton setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    
    //4. Add SiwA button
}


@end
