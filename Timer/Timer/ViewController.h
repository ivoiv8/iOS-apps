//
//  ViewController.h
//  Timer
//
//  Created by Ivaylo Ivanov on 28.11.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
    
@property (weak, nonatomic) IBOutlet UILabel *textTimer;
@property (weak, nonatomic) IBOutlet UIButton *reset;
- (IBAction)touchStart:(id)sender;
- (IBAction)touchReset:(id)sender;
- (void) tick: (id) sender;

@property (weak, nonatomic) IBOutlet UIImageView *image;
- (void) animate;


@end
