//
//  DisplayEditViewController.h
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 21.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@interface DisplayEditViewController : UIViewController

@property (nonatomic, strong) Location *currentLocation;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *summaryField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

- (IBAction)startEditing:(id)sender;
- (IBAction)doneEditing:(id)sender;
- (IBAction)hideKeyboard:(id)sender;


@end

