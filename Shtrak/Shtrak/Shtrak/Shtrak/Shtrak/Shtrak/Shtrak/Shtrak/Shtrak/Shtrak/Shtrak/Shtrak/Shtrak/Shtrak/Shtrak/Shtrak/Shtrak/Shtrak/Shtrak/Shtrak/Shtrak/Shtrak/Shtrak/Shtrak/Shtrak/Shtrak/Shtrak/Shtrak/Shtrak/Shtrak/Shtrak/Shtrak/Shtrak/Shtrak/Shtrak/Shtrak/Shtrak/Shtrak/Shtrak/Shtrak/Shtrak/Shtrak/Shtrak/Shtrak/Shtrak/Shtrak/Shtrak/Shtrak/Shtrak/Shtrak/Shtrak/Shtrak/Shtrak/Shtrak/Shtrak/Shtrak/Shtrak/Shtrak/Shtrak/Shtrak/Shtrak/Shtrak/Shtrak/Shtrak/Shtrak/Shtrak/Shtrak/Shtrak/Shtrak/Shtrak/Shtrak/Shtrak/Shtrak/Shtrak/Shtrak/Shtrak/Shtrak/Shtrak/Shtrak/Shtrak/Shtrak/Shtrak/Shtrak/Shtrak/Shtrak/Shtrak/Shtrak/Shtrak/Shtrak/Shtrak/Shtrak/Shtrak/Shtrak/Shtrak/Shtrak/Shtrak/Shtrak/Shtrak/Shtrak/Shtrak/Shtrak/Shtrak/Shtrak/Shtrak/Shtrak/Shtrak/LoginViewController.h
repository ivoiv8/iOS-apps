//
//  LoginViewController.h
//  Shtrak
//
//  Created by Ivaylo Ivanov on 10.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *setUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *setPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)registerButton:(id)sender;
- (IBAction)loginButton:(id)sender;


@end
