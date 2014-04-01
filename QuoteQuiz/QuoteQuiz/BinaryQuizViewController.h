//
//  BinaryQuizViewController.h
//  QuoteQuiz
//
//  Created by Ivaylo Ivanov on 30.03.14.
//  Copyright (c) 2014 г. Ivaylo Ivanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface BinaryQuizViewController : UIViewController{
    int currentQuote;
    int score;
    
    SystemSoundID hornSound;
    SystemSoundID zipSound;
}
@property (weak, nonatomic) IBOutlet UILabel *lblQuiz;
@property (weak, nonatomic) IBOutlet UILabel *lblQuote;
@property (weak, nonatomic) IBOutlet UILabel *lblOption;

@property (weak, nonatomic) IBOutlet UILabel *lblQuoteNumber;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UIButton *lblYes;
@property (weak, nonatomic) IBOutlet UIButton *lblNo;
@property (weak, nonatomic) IBOutlet UIButton *lblNext;
@property (weak, nonatomic) IBOutlet UIButton *lblExit;

@property (strong, nonatomic) NSArray *quotes;

@property (weak, nonatomic) NSString *answer;
@property (weak, nonatomic) NSString *option;

@property (strong, nonatomic) NSString *successMessage;
@property (strong, nonatomic) NSString *failMessage;


- (IBAction)btnYes:(id)sender;
- (IBAction)btnNo:(id)sender;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnExit:(id)sender;

@end
