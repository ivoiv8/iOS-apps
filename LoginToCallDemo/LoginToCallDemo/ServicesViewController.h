//
//  ServicesViewController.h
//  LoginToCallDemo
//
//  Created by Ivaylo Ivanov on 10.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CallOperatorCell.h"
#import "OfferCell.h"
#import "ServiceCell.h"

@interface ServicesViewController : UIViewController <UICollectionViewDataSource, UIDynamicAnimatorDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *services;


- (IBAction)revealMenu:(id)sender;


@end
