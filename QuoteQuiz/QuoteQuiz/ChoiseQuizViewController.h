//
//  ChoiseQuizViewController.h
//  QuoteQuiz
//
//  Created by Ivaylo Ivanov on 30.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ChoiseQuizViewController : UIViewController{
    int currentQuote;
    int score;
    
    SystemSoundID hornSound;
    SystemSoundID zipSound;
}

@property (weak, nonatomic) IBOutlet UILabel *lblQuiz;
@property (weak, nonatomic) IBOutlet UILabel *lblQuote;
@property (weak, nonatomic) IBOutlet UIButton *lblAnswerA;
@property (weak, nonatomic) IBOutlet UIButton *lblAnswerB;
@property (weak, nonatomic) IBOutlet UIButton *lblAnswerC;
@property (weak, nonatomic) IBOutlet UILabel *lblQuoteNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UIButton *lblNext;
@property (weak, nonatomic) IBOutlet UIButton *lblExit;

@property (strong, nonatomic) NSArray *quotes;
@property (weak, nonatomic) NSString *answerA;
@property (weak, nonatomic) NSString *answerB;
@property (weak, nonatomic) NSString *answerC;
@property (weak, nonatomic) NSString *answer;
@property (strong, nonatomic) NSString *successMesage;
@property (strong, nonatomic) NSString *failMesage;


- (IBAction)btnAnswerA:(id)sender;
- (IBAction)btnAnswerB:(id)sender;
- (IBAction)btnAnswerC:(id)sender;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnExit:(id)sender;


@end
