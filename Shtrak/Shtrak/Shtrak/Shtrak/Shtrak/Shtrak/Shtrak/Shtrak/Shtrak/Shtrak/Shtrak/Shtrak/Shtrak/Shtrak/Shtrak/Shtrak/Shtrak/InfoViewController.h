//
//  InfoViewController.h
//  PhotoViewer
//
//  Created by Ivaylo Ivanov on 23.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"


@interface InfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailsLable;

@property (nonatomic, strong) Photo *currentPhoto;
- (IBAction)dismiss:(id)sender;


@end
