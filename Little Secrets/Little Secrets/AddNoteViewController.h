//
//  AddNoteViewController.h
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 24.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

#import "GADBannerView.h"

#import "GAITrackedViewController.h"


@protocol AddNoteViewControllerDelegate;


@interface AddNoteViewController : GAITrackedViewController <UITextFieldDelegate>{
    GADBannerView *bannerView_;
}


@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *categoryField;
@property (weak, nonatomic) IBOutlet UITextView *detailsField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (nonatomic, weak) id <AddNoteViewControllerDelegate> delegate;

@property (nonatomic, strong) Note *currentNote;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end

@protocol AddNoteViewControllerDelegate
-(void)addNoteViewControllerDidSave;
-(void)addNoteViewControllerDidCancel:(Note *)noteToDelete;
@end