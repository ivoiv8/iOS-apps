//
//  LoginViewController.m
//  Shtrak
//
//  Created by Ivaylo Ivanov on 10.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    NSFileManager *fileManager;
    NSString *fullPath;
    NSFileHandle *fileHandle;
}

@end

@implementation LoginViewController

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
    
    self.passwordTextField.secureTextEntry = YES;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths objectAtIndex:0];
    
    fileManager =  [NSFileManager defaultManager];
    fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:[filePath stringByAppendingPathComponent:@"Registration.txt"]];
                  
    [fileManager changeCurrentDirectoryPath:filePath];
                  fullPath = [NSString stringWithFormat:@"%@", [filePath stringByAppendingPathComponent:@"Registration.txt"]];
                  
    



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerButton:(id)sender {
    
    BOOL fileExist = [[NSFileManager defaultManager]fileExistsAtPath:fullPath];
                      
    if (!fileExist){
    [fileManager createFileAtPath:fullPath contents:nil attributes:nil];
                      }
                      
          NSString *registrationString = [NSString stringWithFormat:@"%@\n%@", self.setUsernameTextField.text, self.setPasswordTextField.text];
                      
          fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:fullPath];
          NSData *data;
          const char *bytesOfRegistration = [registrationString UTF8String];
          data = [NSData dataWithBytes:bytesOfRegistration length:strlen(bytesOfRegistration)];
          [data writeToFile:fullPath atomically:YES];
          
          UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Щрак!" message:@"Регистрацията е успешна" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
          [alert show];
                      
}

- (IBAction)loginButton:(id)sender {
    
    BOOL fileExist = [[NSFileManager defaultManager]fileExistsAtPath:fullPath];
    if (!fileExist) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Нямате регистрация!" message:@"Моля регистрирайте се!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else
    {
        fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:fullPath];
        NSString *stringFromFile = [NSString stringWithContentsOfFile:fullPath encoding:NSASCIIStringEncoding error:nil];
        
        const char *charsFromFile = [stringFromFile UTF8String];
        
        NSString *usernameFromFile = [[NSString alloc]init];
        NSString *passwordFromFile = [[NSString alloc]init];
        
        int count = 0;
        for (int i = 0; i < strlen(charsFromFile); i++) {
            if (charsFromFile[i]=='\n') {
                ++count;
            }
            else if(count == 0) // append characters to usernamefromfile
            {
                usernameFromFile = [usernameFromFile stringByAppendingString:[NSString stringWithFormat:@"%c", charsFromFile[i]]];
            }
            else    // append characters to passwordfromfile
            {
                passwordFromFile = [passwordFromFile stringByAppendingString:[NSString stringWithFormat:@"%c", charsFromFile[i]]];
            }
        }
        
        if ([usernameFromFile isEqualToString:self.usernameTextField.text] && [passwordFromFile isEqualToString:self.passwordTextField.text]) {
            [self performSegueWithIdentifier:@"ShtrakTabSegue" sender:self];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Цък!" message:@"Username или Password са сгрешени" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
        
    }
    
    
    
    
    
    
}
@end


















