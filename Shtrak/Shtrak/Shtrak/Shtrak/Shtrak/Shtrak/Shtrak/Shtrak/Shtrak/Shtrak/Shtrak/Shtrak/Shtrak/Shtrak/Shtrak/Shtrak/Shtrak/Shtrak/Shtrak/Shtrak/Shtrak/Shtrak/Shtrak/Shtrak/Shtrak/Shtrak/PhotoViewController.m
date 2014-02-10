//
//  PhotoViewController.m
//  Shtrak
//
//  Created by Ivaylo Ivanov on 28.02.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

@synthesize imageView, img;

- (IBAction) handlePinch:(UIPinchGestureRecognizer *)
sender{

    CGFloat lasScaleFactor =1;
    CGFloat factor = [(UIPinchGestureRecognizer *) sender scale];
    
    if (factor>1) {
        imageView.transform=CGAffineTransformMakeScale(
            lasScaleFactor + (factor -1),
            lasScaleFactor + (factor -1));
    }else{
            imageView.transform=CGAffineTransformMakeScale(
            lasScaleFactor * factor,
            lasScaleFactor * factor);
        }
        
        if(sender.state==UIGestureRecognizerStateEnded)
        {
            if (factor > 1)
                lasScaleFactor += (factor-1);
            else
                lasScaleFactor *= factor;
        }
        
    }
//- (id)performSelector:(SEL)aSelector withObject:(id)object;

- (void) handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    switch (recognizer.direction)
    {
        case (UISwipeGestureRecognizerDirectionRight):
            [self performSelector:@selector(previousPage:)];
            //[self previousPage];
            break;
            
        case (UISwipeGestureRecognizerDirectionLeft):
            [self performSelector:@selector(nextPage:)];
            //[self nextPage];
            break;
            
        default:
            break;
    }     }



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
	// Do any additional setup after loading the view.
    self.imageView.image = self.img;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
