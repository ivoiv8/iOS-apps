//
//  DisplayEditViewController.m
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 05.04.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "DisplayEditViewController.h"
#import "AppDelegate.h"

#import "GAI.h"


@interface DisplayEditViewController ()

@end

@implementation DisplayEditViewController

@synthesize titleField;
@synthesize categoryField;
@synthesize detailsField;
@synthesize dateField;

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
        
//    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    
	// Do any additional setup after loading the view.
    
    titleField.text = [self.currentNote title];
    categoryField.text = [self.currentNote category];
    detailsField.text = [self.currentNote details];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"dd-MMMM-yyyy"];
    dateField.text = [df stringFromDate:[self.currentNote createDate]];
    
    
    
    // Create a view of the standard size at the top of the screen.
    // Available AdSize constants are explained in GADAdSize.h.
    bannerView_ = [[GADBannerView alloc]
                   initWithFrame:CGRectMake(0.0,
                                            50.0 -
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
    
    // returns the same tracker you created in your app delegate
    // defaultTracker originally declared in AppDelegate.m
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    // manual screen tracking
    [tracker sendView:@"View Secret"];
}

- (void)viewDidUnload
{
    [self setTitleField:nil];
    [self setCategoryField:nil];
    [self setDetailsField:nil];
    [self setDateField:nil];
    [self setEditButton:nil];
    [self setDoneButton:nil];
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
    [categoryField resignFirstResponder];
    [detailsField resignFirstResponder];
}


- (IBAction)startEditing:(id)sender {
    titleField.enabled = YES;
    categoryField.enabled = YES;
    detailsField.editable = YES;
    dateField.enabled = NO;
    
    editButton.hidden = YES;
    doneButton.enabled = YES;
}
- (IBAction)doneEditing:(id)sender {
       
    [titleField resignFirstResponder];
    [categoryField resignFirstResponder];
    [detailsField resignFirstResponder];

    titleField.enabled = NO;
    categoryField.enabled = NO;
    detailsField.editable = NO;
    dateField.enabled = NO;
    
    editButton.hidden = NO;
    doneButton.enabled = NO;
    
    _currentNote.title = titleField.text;
    _currentNote.category = categoryField.text;
    _currentNote.details = detailsField.text;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MMMM-yyyy"];
    _currentNote.createDate = [df dateFromString:dateField.text];
    
    AppDelegate *myApp = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    [myApp saveContext];
    
}
@end