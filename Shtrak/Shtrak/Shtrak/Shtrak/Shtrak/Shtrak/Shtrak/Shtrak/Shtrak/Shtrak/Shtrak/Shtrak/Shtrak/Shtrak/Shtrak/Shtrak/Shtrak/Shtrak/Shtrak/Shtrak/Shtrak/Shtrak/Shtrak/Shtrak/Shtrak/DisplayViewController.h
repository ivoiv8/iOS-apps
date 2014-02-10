//
//  DisplayViewController.h
//  PhotoViewer
//
//  Created by Ivaylo Ivanov on 23.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "InfoViewController.h"

@interface DisplayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@property (nonatomic, strong) Photo *currentPhoto;


@end
