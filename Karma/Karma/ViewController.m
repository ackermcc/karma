//
//  ViewController.m
//  Karma
//
//  Created by Chad Ackerman on 5/6/15.
//  Copyright (c) 2015 Chad Ackerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.delegate = self;
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
    }
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (!error) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
