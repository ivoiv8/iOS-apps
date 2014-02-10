//
//  PhotoViewController.h
//  Shtrak
//
//  Created by Ivaylo Ivanov on 28.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController

- (IBAction) handlePinch:(UIPinchGestureRecognizer *)
   sender;

- (IBAction) handleSwipe:(UIGestureRecognizer *)sender;


@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property(strong) UIImage *img;


@end
