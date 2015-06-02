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
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (!error) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 
                 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                 
                 //Check if this is the user first visit
                 NSObject *obj = [defaults objectForKey:@"authenticatedUser"];
                 if (obj != nil) {
                     NSLog(@"Been here before bro.");
                     
                     //Update view
                     [self userSignIn];
                 } else {
                     NSLog(@"Brand spankin new user.");
                     
                     //Assign login to user defaults
                     [defaults setValue:@"1" forKey:@"authenticatedUser"];
                     [defaults synchronize];
                     
                     //Update view
                     [self newUserSignUp];
                 }
             }
         }];
    }
}

- (void)userSignIn
{
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
    
    appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
}

-(void)newUserSignUp {
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
    
    appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"newUser"];
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
