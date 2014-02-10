//
//  ViewController.m
//  Timer
//
//  Created by Ivaylo Ivanov on 28.11.13.
//  Copyright (c) 2013 г. Ivaylo Ivanov. All rights reserved.
//

#import "ViewController.h"

int seconds = 0;
int minutes = 0;
int hours = 0;
BOOL started = TRUE;

@interface ViewController ()

@end

@implementation ViewController
@synthesize image;


-(void) animate{
    float duration = 60;
    float angle = 360.0;
    int count = INFINITY;
    
    dispatch_queue_t animationQueue = dispatch_queue_create("gear animation", NULL);
    dispatch_async(animationQueue, ^{
        CABasicAnimation *myRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        myRotation.fromValue = [NSNumber numberWithFloat:0];
        myRotation.toValue = [NSNumber numberWithFloat:angle * M_PI / 180];
        myRotation.duration = duration;
        myRotation.fillMode = kCAFillModeForwards;
        myRotation.removedOnCompletion = NO;
        myRotation.repeatCount = count;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [[image layer] addAnimation:myRotation forKey:@"transform.rotation"];
        });
    });

}

-(void) stopAnimation{
   
    CABasicAnimation *myRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    myRotation.toValue = [NSNumber numberWithFloat:0];

    [[image layer] addAnimation:myRotation forKey:@"transform.rotation"];

    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _textTimer.font = [UIFont fontWithName:@"Helvetica-Bold" size:50];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchStart:(id)sender {
    if (started) {
        [_reset setTitle:@"Stop" forState:UIControlStateNormal];
        started=FALSE;
        [self tick:nil];
        
        [self performSelector:@selector(animate) withObject:nil afterDelay:0.0];

    }else {
        started=TRUE;
        [_reset setTitle:@"Start" forState:UIControlStateNormal];
        
        [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:0.0];
    }
}


- (IBAction)touchReset:(id)sender {
    seconds = 0;
    minutes = 0;
    hours = 0;
    [_reset setTitle:@"Start" forState:UIControlStateNormal];
    if (!started){
        started=TRUE;
    }
    
    [_textTimer setText:@"00:00:00"];
    
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:0.0];

    
}

-(void) tick:(id)sender{
    
    dispatch_queue_t timerQueue = dispatch_queue_create("time counter", NULL);
    dispatch_async(timerQueue, ^{
    if (!started){
        NSString *sec=[NSString stringWithFormat:@"%i", seconds];
        if (seconds<10){
            sec=[NSString stringWithFormat:@"0%i", seconds];
        }
        NSString *min=[NSString stringWithFormat:@"%i", minutes];
        if (minutes<10){
            min=[NSString stringWithFormat:@"0%i", minutes];
        }
        NSString *hour=[NSString stringWithFormat:@"%i", hours];
        if (hours<10){
            hour=[NSString stringWithFormat:@"0%i", hours];
        
        NSString *time=[NSString stringWithFormat:@"%@:%@:%@", hour, min, sec];
            
        dispatch_async(dispatch_get_main_queue(), ^{
        [_textTimer setText:time];
        [self performSelector:@selector(tick:) withObject:nil afterDelay:1.0];
        seconds++;
        if (seconds>59){
            seconds=0;
            minutes++;
            }
        if (minutes>59) {
                minutes=0;
                hours++;
            }
        });
        }
        
    }
    });
}

@end
