//
//  SignInViewController.m
//  LoginToCallDemo
//
//  Created by Ivaylo Ivanov on 13.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import "SignInViewController.h"
#import "LoginToCallDemoConstants.h"
#import "KeychainWrapper.h"
#import "InitViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.pinValidated = NO;
    self.nameValidated = NO;
    
    [[NSUserDefaults standardUserDefaults] setValue:@"demo@demo.bg" forKey:USERNAME];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSUInteger fieldHash = [@"demo" hash];
    // 4
    NSString *fieldString = [KeychainWrapper securedSHA256DigestHashForPIN:fieldHash];
    
    // Save PIN hash to the keychain
    if ([KeychainWrapper createKeychainValue:fieldString forIdentifier:PIN_SAVED]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:PIN_SAVED];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    _nameField.delegate = self;
    _nameField.tag = kTextFieldName;
    
    _pinField.delegate = self;
    _pinField.tag = kTextFieldPIN;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    
    switch (textField.tag) {
        case kTextFieldPIN: // We go here if this is the 2nd+ time used (we've already set a PIN at Setup)
            NSLog(@"User entered PIN to validate");
            if ([textField.text length] > 0) {
                
                NSUInteger fieldHash = [textField.text hash]; // Get the hash of the entered PIN
                if ([KeychainWrapper compareKeychainValueForMatchingPIN:fieldHash]) { // Compare them
                    NSLog(@"** User PIN Authenticated!!");
                    self.pinValidated = YES;
                } else {
                    NSLog(@"** Wrong Password :(");
                    self.pinValidated = NO;
                }
            }
            break;
            
        case kTextFieldName: // We go here if this is the 2nd+ time used (we've already set a PIN at Setup)
            NSLog(@"User entered name to validate");
            if ([textField.text length] > 0) {
                
                if ([_nameField.text isEqualToString: [[NSUserDefaults standardUserDefaults] stringForKey:USERNAME]]) { // Compare them
                    NSLog(@"** User Name Authenticated!!");
                    self.nameValidated = YES;
                } else {
                    NSLog(@"** Wrong Name");
                    self.nameValidated = NO;
                }
            }
            break;
            
        default:
            break;
    }
    
    
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"login"] && (self.pinValidated) )
    {
        return YES;
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong Data"
                                                        message:@"Enter:\n demo@demo.bg\n demo"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return NO;
        
    }
}

// Focusing on the next textfield after tapping Return on the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if(theTextField == _nameField){
        [_pinField becomeFirstResponder];
    }
    if(theTextField == _pinField){
        [_pinField resignFirstResponder];
    }
    return NO;
}


- (IBAction)login:(id)sender {
    
}


@end
