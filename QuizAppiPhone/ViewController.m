//
//  ViewController.m
//  QuizAppiPhone
//
//  Created by Saiteja Samudrala on 7/15/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize Aoption = _Aoption;
@synthesize Boption = _Boption;
@synthesize Coption = _Coption;
@synthesize Doption = _Doption;
@synthesize Eoption = _Eoption;
@synthesize Foption = _Foption;

- (void)viewDidLoad
{
  
   [super viewDidLoad];
    
   
    _verify = 0;
    _state = [[NSString alloc]init];
    
        _state = @"initial";
    
    [_scroller setScrollEnabled:YES];
    [_scroller setContentSize:CGSizeMake(320, 618)];
    
    _g = 0;
    _buttons = [[NSArray alloc]initWithObjects:_Aoption,_Boption,_Coption,_Doption,_Eoption,_Foption, nil];
    _labels = [[NSArray alloc]initWithObjects: _A, _B, _C, _D, _E, _F, nil];
    _answers = [[NSMutableArray alloc]initWithCapacity:100];
   
    NSString *filePath3 = [[NSBundle mainBundle] pathForResource:@"quizmenu"
                                                          ofType:@"txt"];
    NSFileHandle * handler = [NSFileHandle fileHandleForReadingAtPath:filePath3];
   NSData * material = [handler readDataToEndOfFile];
    NSString * materials = [[NSString alloc]initWithData:material encoding:NSUTF8StringEncoding];
    NSArray * myarray = [materials componentsSeparatedByString:@"\n" ];
    NSMutableString * arrow = [[NSMutableString alloc]init];
    
    for(NSString * lines in myarray){
        
        [arrow appendFormat:@"%@\n", lines];
    }
    
    _blank.text = arrow;


    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doUpdate:)
                                                 name:UIApplicationWillResignActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(doUpdate2:)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
     NSLog (@"view did load happened bro");
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)start{

    if (_verify==0) {
   _quiztype = _field.text;
    
    }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:_quiztype
                                                         ofType:@"txt"];

    if([[NSFileManager defaultManager]fileExistsAtPath: filePath]) {
    
        _error.hidden = YES;
        _master =  [[FileMaster alloc]initWithPath:filePath];
    
    
    
    _quizItems = [[NSMutableArray alloc]initWithCapacity:100];
    _quizItems = [_master returnQuizItems];


  
    if(_g == [_quizItems count]  ){
        
        for(UILabel * label in _labels) {
            
            label.hidden = YES;
            NSLog(@"hi");
        }
        
        
        for(UIButton * button in _buttons) {
            
            button.hidden = YES;
        }
        _Aoption. hidden = YES;
        _state = @"gotresults";
        _Results.hidden = NO;
        _Score.hidden = NO;
        _Question.hidden = YES;
        _got.hidden = NO;
        _takequiz.hidden = NO;
        _startbutton.hidden = YES;
        _bulb.hidden = YES;
        _field.hidden = YES;
        _blank.hidden = YES;
        _label.hidden = YES;
        _available.hidden = YES;
        for(NSString * S in _answers) {
            
            NSLog(@"%@",S);
        }
        NSString * sentence = [NSString stringWithFormat:@" %d", [_master returnScore:_answers and: _quizItems]];
        _Score .text = sentence;
        _quizItems = nil;
        
        
    }

if(_g  < [_quizItems count]  ){
    
    QuizItem * item = [[QuizItem alloc]init];
    item = [_quizItems objectAtIndex:_g];
    _Question.text =  item.Question ;
    
        _Foption.hidden = NO;
        
        for(UILabel * label in _labels) {
            
            label.hidden = NO;
        }
        
        for(UIButton * button in _buttons) {
            
            button.hidden = NO;
        }
        _startbutton.hidden = YES;
        _bulb.hidden = YES;
        _Question.hidden = NO;
  
        
        
    _state = @"startpressed";
    if(![item.Achoice isEqual: @""]){
        _A.hidden = NO;
        _Aoption.hidden = NO;
        
        _A.text = item.Achoice;} else {
            _A.hidden = YES;
            _Aoption.hidden = YES;
        }
    
    if(![item.Bchoice isEqual: @""]){
        _B.hidden = NO;
        _Boption.hidden = NO;
        
        _B.text = item.Bchoice;} else {
            _B.hidden = YES;
            _Boption.hidden = YES;
        }
    
    if(![item.Cchoice  isEqual: @""]){
        _C.hidden = NO;
        _Coption.hidden = NO;
        
        _C.text = item.Cchoice;} else {
            _C.hidden = YES;
            _Coption.hidden = YES;
        }
    
    if(![item.Dchoice  isEqual: @""]){
        _D.hidden = NO;
        _Doption.hidden = NO;
        
        _D.text = item.Dchoice;} else {
            _D.hidden = YES;
            _Doption.hidden = YES;
        }
    
    if(![item.Echoice  isEqual: @""]){
        _E.hidden = NO;
        _Eoption.hidden = NO;
        
        _E.text = item.Echoice;} else {
            _E.hidden = YES;
            _Eoption.hidden = YES;
        }
    
    if(![item.Fchoice  isEqual: @""]){
        _F.hidden = NO;
        _Foption.hidden = NO;
        
        _F.text = item.Fchoice;} else {
            _F.hidden = YES;
            _Foption.hidden = YES;
        }
    _field.hidden = YES;
    _blank.hidden = YES;
    _label.hidden = YES;
    _available.hidden = YES;
    _g++;
} }else {
    
    _error.text = @"Enter valid type";
}
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation) UIInterfaceOrientationLandscape duration:(NSTimeInterval) duration {
    
    if (UIDeviceOrientationIsPortrait(self.interfaceOrientation))
    {
        NSLog(@"turned to portrait");
    
        _Question.numberOfLines = 5;
        _A.numberOfLines = 3;
        _B.numberOfLines = 3;
        _C.numberOfLines = 3;
        _D.numberOfLines = 3;
        _E.numberOfLines = 3;
        _F.numberOfLines = 3;
        
       

//I made other rotation adjustments directly on my storyboard
    }
    
    
    if (UIDeviceOrientationIsLandscape(self.interfaceOrientation))
    {
        NSLog(@"turned to landscape");
        
        _Question.numberOfLines = 2;
        _A.numberOfLines = 1;
        _B.numberOfLines = 1;
        _C.numberOfLines = 1;
        _D.numberOfLines = 1;
        _E.numberOfLines = 1;
        _F.numberOfLines = 1;
        
        //I made other rotation adjustments directly on my storyboard
    }

    
    
}
-(void)doUpdate2:(NSNotification*)note
{
    
    [self restoreController];
    NSLog(@"hi");
}



-(void)doUpdate:(NSNotification*)note
{
    
    [self preserveController];
 NSLog(@"hi");
}


-(IBAction)getAnswerorResults:(id)sender{
_state = @"ongoingquiz";
    UIButton * button = (UIButton*)sender;
    
    NSString * buttontitle = [NSString stringWithFormat:@"Answer:%@",button.titleLabel.text];
    
    NSLog(@"%@",buttontitle);
    [_answers addObject:buttontitle];

    _quizItems = [[NSMutableArray alloc]initWithCapacity:100];
    _quizItems = [_master returnQuizItems];
    

    if(_g == [_quizItems count]  ){
    
        for(UILabel * label in _labels) {
            
            label.hidden = YES;
            NSLog(@"hi");
        }
        
        
        for(UIButton * button in _buttons) {
            
            button.hidden = YES;
        }
        _Aoption. hidden = YES;
        _state = @"gotresults";
        _Results.hidden = NO;
        _Score.hidden = NO;
        _Question.hidden = YES;
        _got.hidden = NO;
         _takequiz.hidden = NO;
    
        for(NSString * S in _answers) {
            
            NSLog(@"%@",S);
        }
        NSString * sentence = [NSString stringWithFormat:@" %d", [_master returnScore:_answers and: _quizItems]];
        _Score .text = sentence;
        _quizItems = nil;
    
        
    }
    
   if(_g  < [_quizItems count]  ){
       _state = @"loadedquestions";
       QuizItem * item = [[QuizItem alloc]init];
    item = [_quizItems objectAtIndex:_g];
    _Question.text =  item.Question ;
    
    if(item.Achoice != nil){
        _A.hidden = NO;
        _Aoption.hidden = NO;
        
        _A.text = item.Achoice;} else {
            _A.hidden = YES;
            _Aoption.hidden = YES;
        }
    
    if(item.Bchoice != nil){
        _B.hidden = NO;
        _Boption.hidden = NO;
        
        _B.text = item.Bchoice;} else {
            _B.hidden = YES;
            _Boption.hidden = YES;
        }
    
    if(item.Cchoice != nil){
        _C.hidden = NO;
        _Coption.hidden = NO;
        
        _C.text = item.Cchoice;} else {
            _C.hidden = YES;
            _Coption.hidden = YES;
        }
    
    if(item.Dchoice != nil){
        _D.hidden = NO;
        _Doption.hidden = NO;
        
        _D.text = item.Dchoice;} else {
            _D.hidden = YES;
            _Doption.hidden = YES;
        }
    
    if(item.Echoice != nil){
        _E.hidden = NO;
        _Eoption.hidden = NO;
        
        _E.text = item.Echoice;} else {
            _E.hidden = YES;
            _Eoption.hidden = YES;
        }
    
    if(item.Fchoice != nil){
        _F.hidden = NO;
        _Foption.hidden = NO;
        
        _F.text = item.Fchoice;} else {
            _F.hidden = YES;
            _Foption.hidden = YES;
        }
    
    
    _g++;


   }
}

-(void)restoreController {
    
    NSLog(@"the restore controller method has been ex");
    NSLog(@"%@,",_state);
    
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"savefile1"
                                                         ofType:@"txt"];
    _reader = [NSFileHandle fileHandleForReadingAtPath:filePath2];
    NSData * read = [_reader readDataToEndOfFile];
    NSString * contents = [[NSString alloc]initWithData:read encoding:NSUTF8StringEncoding];
    NSString * contentsify = [contents stringByReplacingOccurrencesOfString:@" " withString:@""];
 
    
    if(! [contentsify isEqual: @""]) {
    
        
       
    
    NSArray * savedstuff = [contents componentsSeparatedByString:@"\n"];
  
        for (NSString * obj in savedstuff){
            NSLog(@"%@",obj);
            if([obj hasPrefix:@"State"]) {
                NSString * Ostring = [NSString stringWithFormat:@""];
                NSScanner * scanner = [NSScanner scannerWithString:obj];
                [scanner scanString:@"State" intoString:nil];
                [scanner scanUpToString:@"\n" intoString: &Ostring];
                _state = Ostring;
                
            }
            if( [_state isEqualToString: @"initial"]) {
            if([obj hasPrefix:@"scroll"]) {
               
                NSString * sstring = [NSString stringWithFormat:@""];
                NSScanner * scanner = [NSScanner scannerWithString:obj];
                [scanner scanString:@"scroll" intoString:nil];
                [scanner scanUpToString:@"\n" intoString: &sstring];
                _scrolloffset = [sstring intValue];
                [_scroller setContentOffset:CGPointMake(0, _scrolloffset)];

            }}
            

        }
        
        
        if(! [_state isEqualToString: @"initial"]) {
            [_answers removeAllObjects];
    for (NSString * obj in savedstuff){
        NSLog(@"%@",obj);
      
        
        if([obj hasPrefix:@"State"]) {
            NSString * Ostring = [NSString stringWithFormat:@""];
            NSScanner * scanner = [NSScanner scannerWithString:obj];
            [scanner scanString:@"State" intoString:nil];
            [scanner scanUpToString:@"\n" intoString: &Ostring];
            _state = Ostring;
            NSLog(@"%@",_state);
        }
        
        if([obj hasPrefix:@"scroll"]) {
    
            NSString * sstring = [NSString stringWithFormat:@""];
            NSScanner * scanner = [NSScanner scannerWithString:obj];
            [scanner scanString:@"scroll" intoString:nil];
            [scanner scanUpToString:@"\n" intoString: &sstring];
            _scrolloffset = [sstring intValue];
            
        }
        
        if([obj hasPrefix:@"quiztype"]) {
    NSLog(@" high fsaf");
            NSString * qstring = [NSString stringWithFormat:@""];
            NSScanner * scanner = [NSScanner scannerWithString:obj];
            [scanner scanString:@"quiztype" intoString:nil];
            [scanner scanUpToString:@"\n" intoString: &qstring];
            _quiztype = qstring;
            NSLog(@"%@ high fsaf",qstring);
            
        }

        
        if([obj hasPrefix:@"g"]) {
            NSString * gstring = [NSString stringWithFormat:@""];
            NSScanner * scanner = [NSScanner scannerWithString:obj];
            [scanner scanString:@"g" intoString:nil];
            [scanner scanUpToString:@"\n" intoString: &gstring];
            _g = [gstring intValue];
            
            if(_g>0) {
                
                _g = _g - 1;
                
            }
            
           
            NSLog(@"%d",_g);
        }
        
        if([obj hasPrefix:@"answer"]) {
            NSString * astring = [NSString stringWithFormat:@""];
            NSScanner * scanner = [NSScanner scannerWithString:obj];
            [scanner scanString:@"answer" intoString:nil];
             [scanner scanUpToString:@"\n" intoString: &astring];
           
            [_answers addObject:astring];
            NSLog(@"anwer man %@",astring);
        
        }
    
      
       
    }
        _verify = 5;
        [_scroller setContentOffset:CGPointMake(0, _scrolloffset)];
            if([_state isEqualToString:@"gotresults"]) {
                
                _g = _g + 1;
            }
         [self start];
    
    }   } }

-(void)preserveController {
      NSLog(@"%@,",_state);
    
    _scrolloffset = _scroller.contentOffset.y;
   
    NSMutableString * line = [[NSMutableString alloc]initWithCapacity:100];
    
    if( _answers != nil) {
        
        for(NSString * solution in _answers) {
            
            [line appendFormat:@"answer%@\n",solution];
        }
        NSLog(@"%@",line);
        
    }
 
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"savefile1"
                                                         ofType:@"txt"];
    if([[NSFileManager defaultManager]fileExistsAtPath:filePath2]) {
        
        
        NSLog(@"yes");
    }
    
    _handle = [NSFileHandle fileHandleForWritingAtPath:filePath2] ;
        [_handle truncateFileAtOffset:0];
    
    [_handle seekToFileOffset:0];
    
    
    NSString * string = [NSString stringWithFormat:@"g%d\n%@scroll%d\nState%@\nquiztype%@",_g,line,_scrolloffset,_state,_quiztype ];
    NSLog(@"scroll sewagger");
    NSData * data3 = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString * string3 = [[NSString alloc]initWithData:data3 encoding:NSUTF8StringEncoding];
    NSLog(@"%@",string3);
    [_handle writeData:data3];
    [_handle closeFile];
}

-(IBAction)kill:(id)sender {
    
    [sender resignFirstResponder];
}

-(IBAction)takeanotherquiz:(id)sender {
    _error.text = @"";
    _Results.hidden = YES;
    _got.hidden = YES;
    _Score.hidden = YES;
    _takequiz.hidden = YES;
    _startbutton.hidden = NO;
    _bulb.hidden = NO;
    _field.text = @"";
    _field.hidden = NO;
    _error.hidden = NO;
    _verify = 0;
    _g = 0;
  _state = @"initial";
    _quiztype = @"";
    _answers = [[NSMutableArray alloc]initWithCapacity:100];
    NSString *filePath3 = [[NSBundle mainBundle] pathForResource:@"quizmenu"
                                                          ofType:@"txt"];
    NSFileHandle * handler = [NSFileHandle fileHandleForReadingAtPath:filePath3];
    NSData * material = [handler readDataToEndOfFile];
    NSString * materials = [[NSString alloc]initWithData:material encoding:NSUTF8StringEncoding];
    NSArray * myarray = [materials componentsSeparatedByString:@"\n" ];
    NSMutableString * arrow = [[NSMutableString alloc]init];
    
    
    
    for(NSString * lines in myarray){
        
        [arrow appendFormat:@"%@\n", lines];
    }
    
    _blank.text = arrow;

    _blank.hidden = NO;
    _available.hidden = NO;
    _label.hidden = NO;
}


@end
