//
//  SignInViewController.h
//  LoginToCallDemo
//
//  Created by Ivaylo Ivanov on 13.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pinField;
- (IBAction)login:(id)sender;

@property (nonatomic) BOOL pinValidated;
@property (nonatomic) BOOL nameValidated;



@end
