//
//  BinaryQuizViewController.m
//  QuoteQuiz
//
//  Created by Ivaylo Ivanov on 30.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import "BinaryQuizViewController.h"

@interface BinaryQuizViewController ()

@end

@implementation BinaryQuizViewController

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BinaryQuiz" ofType:@"plist"];
    self.quotes = [[NSArray alloc]initWithContentsOfFile:path];
    
    currentQuote = -1;
    score = 0;
    self.lblNext.hidden = YES;
    self.lblExit.hidden = YES;
    
    
    NSURL *hornSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"HORN" ofType:@"WAV"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)hornSoundURL, &hornSound);
    
    NSURL *zipSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"ZIP" ofType:@"WAV"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)zipSoundURL, &zipSound);
    
    
    [self showNextQuestion];
    
}

-(void)showNextQuestion {
    
    currentQuote++;
    
    NSString *progress = [NSString stringWithFormat:@"Quote %i of %i", currentQuote + 1, [self.quotes count]];
    self.lblQuoteNumber.text = progress;
    
    
    if (currentQuote < [self.quotes count]) {
        
        NSDictionary *nextQuestion = [self.quotes objectAtIndex:currentQuote];
        
        self.option = [nextQuestion objectForKey:@"Option"];
        
        self.answer = [nextQuestion objectForKey:@"Author"];
        
        self.lblQuote.text = [nextQuestion objectForKey:@"Quote"];
        self.lblOption.text = [nextQuestion objectForKey:@"Option"];
        self.lblScore.text = [NSString stringWithFormat:@"Score: %i", score];
        
        self.successMessage = [NSString stringWithFormat:@"Correct! The right answer is: %@", self.answer];
        
        self.failMessage = [NSString stringWithFormat:@"Sorry, you are wrong! The right answer is: %@", self.answer];
        
        
    } else {
        // show message, hide answers buttonss and show the exit button
        
        NSString *finalMessage = [NSString stringWithFormat:@"You have reached the end of the Quiz and your score is %i", score];
        self.lblQuote.text = finalMessage;
        
        self.lblQuiz.hidden = YES;
        self.lblScore.hidden = YES;
        self.lblQuoteNumber.hidden = YES;
        self.lblNext.hidden = YES;
        self.lblYes.hidden = YES;
        self.lblNo.hidden = YES;
        self.lblOption.hidden = YES;
        
        self.lblExit.hidden = NO;
        
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnYes:(id)sender {
    
    if ([self.answer isEqualToString:self.option]) {
        score++;
        AudioServicesPlaySystemSound(zipSound);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Well Done"
                                                        message:self.successMessage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
        
        AudioServicesPlaySystemSound(hornSound);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OOOPPSS!"
                                                        message:self.failMessage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    self.lblYes.hidden = YES;
    self.lblNo.hidden = YES;
    self.lblNext.hidden = NO;
    
}


- (IBAction)btnNo:(id)sender {
    
    if (![self.answer isEqualToString:self.option]) {
        score++;
        AudioServicesPlaySystemSound(zipSound);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Well Done"
                                                        message:self.successMessage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
        
        AudioServicesPlaySystemSound(hornSound);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OOOPPSS!"
                                                        message:self.failMessage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    self.lblYes.hidden = YES;
    self.lblNo.hidden = YES;
    self.lblNext.hidden = NO;
    
}


- (IBAction)btnNext:(id)sender {
    
    if (currentQuote < [self.quotes count]) {
        self.lblYes.hidden = NO;
        self.lblNo.hidden = NO;
        self.lblNext.hidden = YES;
        [self showNextQuestion];
        
    }
}


- (IBAction)btnExit:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
