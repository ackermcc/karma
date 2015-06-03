//
//  NewUserViewController.m
//  Karma
//
//  Created by Chad Ackerman on 6/1/15.
//  Copyright (c) 2015 Chad Ackerman. All rights reserved.
//

#import "NewUserViewController.h"

@interface NewUserViewController ()

@end

@implementation NewUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.userInfo = [NSDictionary new];
    self.userInfo = [defaults objectForKey:@"authenticatingUser"];
    
    NSLog(@"///////////////////////////////////// %@",self.userInfo);
    self.inputFirstName.text = [self.userInfo valueForKey:@"first_name"];
    self.inputLastName.text = [self.userInfo valueForKey:@"last_name"];
    self.inputEmailAddress.text = [self.userInfo valueForKey:@"email"];
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

- (IBAction)cancelSignUp:(id)sender {
    //log out of facebook
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
    
    //remove defaults record
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:@"authenticatingUser"];
    [defaults synchronize];
    
    //return to log in view
    AppDelegate *appDelegateTemp = [[UIApplication sharedApplication]delegate];
    appDelegateTemp.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginViewController"];
}
@end
