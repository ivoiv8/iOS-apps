//
//  AddLocationViewController.m
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 21.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "AddLocationViewController.h"
#import "AppDelegate.h"

@interface AddLocationViewController ()

@end

@implementation AddLocationViewController

@synthesize titleField;
@synthesize summaryField;



- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqual: @"Summary"]) {
        textView.text = @"";
    } else {
        NULL;
    }
    
}

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
    
    titleField.text = [self.currentLocation title];
    summaryField.text = [self.currentLocation summary];
    
    
}

- (void)viewDidUnload
{
    [self setTitleField:nil];
    [self setSummaryField:nil];
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


- (IBAction)cancel:(id)sender {
    // dismiss and remove the object
    [self.delegate addLocationViewControllerDidCancel:[self currentLocation]];
}

- (IBAction)save:(id)sender {
    // dismiss and save the context
    [self.currentLocation setTitle:titleField.text];
    [self.currentLocation setSummary:summaryField.text];

    
    [self.delegate addLocationViewControllerDidSave];
    
}
@end
