//
//  DashboardViewController.m
//  Karma
//
//  Created by Chad Ackerman on 5/7/15.
//  Copyright (c) 2015 Chad Ackerman. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.delegate = self;
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {

}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    // Delete User credential from NSUserDefaults and other data related to user
    
    //Assign login to user defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:@"0" forKey:@"authenticatedUser"];
    [defaults synchronize];
    
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
    
    UIViewController* rootController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController:rootController];
    appDelegateTemp.window.rootViewController = navigation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
