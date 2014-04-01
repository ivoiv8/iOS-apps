//
//  ChoiseQuizViewController.m
//  QuoteQuiz
//
//  Created by Ivaylo Ivanov on 30.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import "ChoiseQuizViewController.h"

@interface ChoiseQuizViewController ()

@end

@implementation ChoiseQuizViewController

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ChoiseQuiz" ofType:@"plist"];
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
        
        self.answerA = [nextQuestion objectForKey:@"Answer A"];
        self.answerB = [nextQuestion objectForKey:@"Answer B"];
        self.answerC = [nextQuestion objectForKey:@"Answer C"];
        self.answer = [nextQuestion objectForKey:@"Author"];
        
        self.lblQuote.text = [nextQuestion objectForKey:@"Quote"];
        self.lblScore.text = [NSString stringWithFormat:@"Score: %i", score];
        [_lblAnswerA setTitle:_answerA forState:UIControlStateNormal];
        [_lblAnswerB setTitle:_answerB forState:UIControlStateNormal];
        [_lblAnswerC setTitle:_answerC forState:UIControlStateNormal];
        
        self.lblAnswerA.enabled = YES;
        self.lblAnswerB.enabled = YES;
        self.lblAnswerC.enabled = YES;
        
        self.successMesage = [NSString stringWithFormat:@"Correct! The right answer is: %@", self.answer];
        
        self.failMesage = [NSString stringWithFormat:@"Sorry, you are wrong! The right answer is: %@", self.answer];
        
        
    } else {
        // show message, hide answers buttonss and show the exit button
        
        NSString *finalMessage = [NSString stringWithFormat:@"You have reached the end of the Quiz and your score is %i", score];
        self.lblQuote.text = finalMessage;
        
        self.lblQuiz.hidden = YES;
        self.lblAnswerA.hidden = YES;
        self.lblAnswerB.hidden = YES;
        self.lblAnswerC.hidden = YES;
        self.lblScore.hidden = YES;
        self.lblQuoteNumber.hidden = YES;
        self.lblNext.hidden = YES;
        
        self.lblExit.hidden = NO;
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAnswerA:(id)sender {
    
    if ([self.answer isEqualToString:self.answerA]) {
        score++;
        AudioServicesPlaySystemSound(zipSound);
        
        self.lblAnswerA.hidden = NO;
        self.lblAnswerA.enabled = NO;
        self.lblAnswerB.hidden = YES;
        self.lblAnswerC.hidden = YES;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Well Done"
                                                        message:self.successMesage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
        
        AudioServicesPlaySystemSound(hornSound);
        
        if ([self.answer isEqualToString:self.answerB]) {
            
            self.lblAnswerA.hidden = YES;
            self.lblAnswerB.hidden = NO;
            self.lblAnswerB.enabled = NO;
            self.lblAnswerC.hidden = YES;
        }
        if ([self.answer isEqualToString:self.answerC]) {
            
            self.lblAnswerA.hidden = YES;
            self.lblAnswerB.hidden = YES;
            self.lblAnswerC.hidden = NO;
            self.lblAnswerC.enabled = NO;
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OOOPPSS!"
                                                        message:self.failMesage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    self.lblNext.hidden = NO;
    
}

- (IBAction)btnAnswerB:(id)sender {
    
    if ([self.answer isEqualToString:self.answerB]) {
        score++;
        AudioServicesPlaySystemSound(zipSound);
        
        self.lblAnswerA.hidden = YES;
        self.lblAnswerB.hidden = NO;
        self.lblAnswerB.enabled = NO;
        self.lblAnswerC.hidden = YES;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Well Done"
                                                        message:self.successMesage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }else {
        
        AudioServicesPlaySystemSound(hornSound);
        
        if ([self.answer isEqualToString:self.answerA]) {
            
            self.lblAnswerA.hidden = NO;
            self.lblAnswerA.enabled = NO;
            self.lblAnswerB.hidden = YES;
            self.lblAnswerC.hidden = YES;
        }
        
        if ([self.answer isEqualToString:self.answerC]) {
            
            
            self.lblAnswerA.hidden = YES;
            self.lblAnswerB.hidden = YES;
            self.lblAnswerC.hidden = NO;
            self.lblAnswerC.enabled = NO;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OOOPPSS!"
                                                        message:self.failMesage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    self.lblNext.hidden = NO;
    
}

- (IBAction)btnAnswerC:(id)sender {
    
    if ([self.answer isEqualToString:self.answerC]) {
        score++;
        AudioServicesPlaySystemSound(zipSound);
        
        self.lblAnswerA.hidden = YES;
        self.lblAnswerB.hidden = YES;
        self.lblAnswerC.hidden = NO;
        self.lblAnswerC.enabled = NO;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Well Done"
                                                        message:self.successMesage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }else {
        
        AudioServicesPlaySystemSound(hornSound);
        
        if ([self.answer isEqualToString:self.answerA]) {
            
            self.lblAnswerA.hidden = NO;
            self.lblAnswerA.enabled = NO;
            self.lblAnswerB.hidden = YES;
            self.lblAnswerC.hidden = YES;
        }
        
        if ([self.answer isEqualToString:self.answerB]) {
            
            self.lblAnswerA.hidden = YES;
            self.lblAnswerB.hidden = NO;
            self.lblAnswerB.enabled = NO;
            self.lblAnswerC.hidden = YES;
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OOOPPSS!"
                                                        message:self.failMesage
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    self.lblNext.hidden = NO;
}


- (IBAction)btnNext:(id)sender {
    
    if (currentQuote <= [self.quotes count]) {
        self.lblAnswerA.hidden = NO;
        self.lblAnswerB.hidden = NO;
        self.lblAnswerC.hidden = NO;
        self.lblNext.hidden = YES;
        [self showNextQuestion];
        
    }    
}

- (IBAction)btnExit:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
