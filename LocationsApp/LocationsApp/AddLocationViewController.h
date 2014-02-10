//
//  AddLocationViewController.h
//  LocationsApp
//
//  Created by Ivaylo Ivanov on 21.12.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

@protocol AddLocationViewControllerDelegate;

@interface AddLocationViewController : UIViewController <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *summaryField;

@property (nonatomic, weak) id <AddLocationViewControllerDelegate> delegate;

@property (nonatomic, strong) Location *currentLocation;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end

@protocol AddLocationViewControllerDelegate
-(void)addLocationViewControllerDidSave;
-(void)addLocationViewControllerDidCancel:(Location *)locationToDelete;

@end