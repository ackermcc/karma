//
//  NewUserViewController.h
//  Karma
//
//  Created by Chad Ackerman on 6/1/15.
//  Copyright (c) 2015 Chad Ackerman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewUserViewController : UIViewController

@property (nonatomic) NSDictionary *userInfo;
@property (weak, nonatomic) IBOutlet UITextField *inputFirstName;
@property (weak, nonatomic) IBOutlet UITextField *inputLastName;
@property (weak, nonatomic) IBOutlet UITextField *inputPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *inputEmailAddress;

@end
