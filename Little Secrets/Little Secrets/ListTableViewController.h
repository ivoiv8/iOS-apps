//
//  ListTableViewController.h
//  Little Secrets
//
//  Created by Ivaylo Ivanov on 24.03.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddNoteViewController.h"
#import <CoreData/CoreData.h>
#import <MessageUI/MessageUI.h>

#import "GADBannerView.h"


@interface ListTableViewController : UITableViewController
<AddNoteViewControllerDelegate, MFMailComposeViewControllerDelegate, NSFetchedResultsControllerDelegate>{
    GADBannerView *bannerView_;
}

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
- (IBAction)mailButton:(id)sender;

@end
