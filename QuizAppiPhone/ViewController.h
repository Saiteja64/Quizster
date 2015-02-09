//
//  ViewController.h
//  QuizAppiPhone
//
//  Created by Saiteja Samudrala on 7/15/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileMaster.h"
#import "QuizItem.h"


@interface ViewController : UIViewController
@property (nonatomic) FileMaster * master;
@property (nonatomic) NSString * state;
@property (strong, nonatomic) NSFileHandle * handle;
@property (nonatomic) NSFileHandle * reader;
@property (nonatomic) int g;
@property (nonatomic) IBOutlet UILabel * Question;
@property (nonatomic) IBOutlet UILabel * Results;
@property (nonatomic) IBOutlet UILabel * Score;
@property (nonatomic) IBOutlet UIButton * Aoption;
@property (nonatomic) IBOutlet UIButton * Boption;
@property (nonatomic) IBOutlet UIButton * Coption;
@property (nonatomic) IBOutlet UIButton * Doption;
@property (nonatomic) IBOutlet UIButton * Eoption;
@property (nonatomic) IBOutlet UIButton * Foption;
@property (nonatomic) IBOutlet UILabel * A;
@property (nonatomic) IBOutlet UILabel * B;
@property (nonatomic) IBOutlet UILabel * C;
@property (nonatomic) IBOutlet UILabel * D;
@property (nonatomic) IBOutlet UILabel * E;
@property (nonatomic) IBOutlet UILabel * F;
@property (nonatomic) IBOutlet UILabel * got;
@property (nonatomic) NSArray * buttons;
@property (nonatomic) NSArray * labels;
@property (nonatomic) NSMutableArray * answers;
@property (nonatomic) NSMutableArray * quizItems;
@property (nonatomic) IBOutlet UIButton * startbutton;
@property (nonatomic) IBOutlet UIImageView * bulb;
@property (nonatomic) NSString * quiztype;
@property (nonatomic) IBOutlet UIScrollView * scroller;
@property (nonatomic) int scrolloffset;
@property (nonatomic) IBOutlet UILabel * blank;
@property (nonatomic) IBOutlet UITextField * field;
@property (nonatomic) IBOutlet UILabel * label;
@property (nonatomic) IBOutlet UILabel * available;
@property (nonatomic) IBOutlet UIButton * takequiz;
@property (nonatomic) int verify;
@property (nonatomic) IBOutlet UILabel * error;
-(IBAction)start;
-(IBAction)getAnswerorResults:(id)sender;
-(void)preserveController;
-(void)restoreController;
-(IBAction)kill:(id)sender;
-(IBAction)takeanotherquiz:(id)sender;
@end
