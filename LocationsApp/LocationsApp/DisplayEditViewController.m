//
//  DisplayEditViewController.m
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 21.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "DisplayEditViewController.h"
#import "AppDelegate.h"

@interface DisplayEditViewController ()

@end

@implementation DisplayEditViewController

@synthesize titleField;
@synthesize summaryField;

@synthesize doneButton;
@synthesize editButton;



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
	// Do any additional setup after loading the view.
    titleField.text = [self.currentLocation title];
    summaryField.text = [self.currentLocation summary];
    
}

- (void)viewDidUnload
{
    [self setTitleField:nil];
    [self setSummaryField:nil];
    [self setEditButton:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)hideKeyboard:(id)sender {
    [titleField resignFirstResponder];
    [summaryField resignFirstResponder];
}


- (IBAction)startEditing:(id)sender {
    titleField.enabled = YES;
    summaryField.editable = YES;
    
    editButton.hidden = YES;
    doneButton.enabled = YES;
}
- (IBAction)doneEditing:(id)sender {
    
    [titleField resignFirstResponder];
    [summaryField resignFirstResponder];
    
    titleField.enabled = NO;
    summaryField.editable = NO;
    
    editButton.hidden = NO;
    doneButton.enabled = NO;
    
    _currentLocation.title = titleField.text;
    _currentLocation.summary = summaryField.text;

    
    AppDelegate *myApp = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    [myApp saveContext];
    
}
@end