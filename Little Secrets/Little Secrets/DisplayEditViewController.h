//
//  DisplayEditViewController.h
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 05.04.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

#import "GADBannerView.h"



@interface DisplayEditViewController : UIViewController <UITextFieldDelegate>{
    GADBannerView *bannerView_;
}


@property (nonatomic, strong) Note *currentNote;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UITextView *detailsField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

- (IBAction)startEditing:(id)sender;
- (IBAction)doneEditing:(id)sender;
- (IBAction)hideKeyboard:(id)sender;


@end
