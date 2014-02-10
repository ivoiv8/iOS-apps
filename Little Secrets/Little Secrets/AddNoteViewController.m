//
//  AddNoteViewController.m
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 24.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "AddNoteViewController.h"
#import "AppDelegate.h"


@interface AddNoteViewController ()

@end

@implementation AddNoteViewController

@synthesize titleField;
@synthesize detailsField;
@synthesize categoryField;
@synthesize dateField;


//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    if ([textView.text isEqual: @"Description"]) {
//        textView.text = @"";
//    } else {
//        NULL;
//    }
//    
//}

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
	
    categoryField.delegate = self;

    
    titleField.text = [self.currentNote title];
    categoryField.text = [self.currentNote category];
    detailsField.text = [self.currentNote details];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd-MMMM-yyyy"];
    dateField.text =[dateFormat stringFromDate:[self.currentNote createDate]];
    
    
    
    
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0.0,
                                            94.0 -
                                            GAD_SIZE_320x50.height,
                                            GAD_SIZE_320x50.width,
                                            GAD_SIZE_320x50.height)];
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    bannerView_.adUnitID = @"14320393f0ef474e";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:[GADRequest request]];
    
    self.trackedViewName = @"New Secret";


    
}

- (void)viewDidUnload
{
    [self setTitleField:nil];
    [self setCategoryField:nil];
    [self setDetailsField:nil];
    [self setDateField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)hideKeyboard:(id)sender {
    [titleField resignFirstResponder];
    [categoryField resignFirstResponder];
    [detailsField resignFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [categoryField resignFirstResponder];
    return YES;
}

- (IBAction)cancel:(id)sender {
    // dismiss and remove the object
    [self.delegate addNoteViewControllerDidCancel:[self currentNote]];
}

- (IBAction)save:(id)sender {
    // dismiss and save the context
    [self.currentNote setTitle:titleField.text];
    [self.currentNote setCategory:categoryField.text];
    [self.currentNote setDetails:detailsField.text];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd-MMMM-yyyy"];
    [self.currentNote setCreateDate:[dateFormat dateFromString:dateField.text]];
    
    [self.delegate addNoteViewControllerDidSave];
    
    
}
@end
