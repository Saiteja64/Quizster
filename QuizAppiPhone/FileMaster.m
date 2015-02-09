//
//  FileMaster.m
//  QuizCline
//
//  Created by Saiteja Samudrala on 7/14/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//
//google IOS scroll View contentoffset


#import "FileMaster.h"


@implementation FileMaster


-(id)initWithPath:(NSString *)path {
    
    id newInstance = [super init];
    if(newInstance){
      
        _handle = [NSFileHandle fileHandleForReadingAtPath:path];
       NSData * data = [_handle readDataToEndOfFile];
        NSString * filecontents = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
      
        
        NSArray * arraycontents = [filecontents componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        QuizItem * _quiz;
        
        _quizarray = [[NSMutableArray alloc]initWithCapacity:100];
        int d = 0;
        
        for (int i = 0; i < [arraycontents count]; i++) {
          
            if(d == 0) {
                
               _quiz = [[QuizItem alloc]init];
                d++;
                
            }
            
            NSString * line = [arraycontents objectAtIndex:i];
            
            if ([line length] == 0) continue;
            if ([line hasPrefix:@"#"])continue;
            
            if([line hasPrefix:@"Question"]) {
                
                _quiz.Question = line;
                
            }
            
            if([line hasPrefix:@"question"]) {
                
                _quiz.Question = line;
                
            }
        
            
            if([_quiz.Achoice isEqualToString:@""])  {
            if([line hasPrefix:@"A"]) {
                
                _quiz.Achoice = line;
                
                
                
                continue;
            } }
            
            if([line hasPrefix:@"B"]){
                
                _quiz.Bchoice = line;
                
            }
            
            
            if([line hasPrefix:@"C"]){
                
              _quiz.Cchoice = line;
                
            }
            
            if([line hasPrefix:@"D"]){
                
               _quiz.Dchoice = line;
                
            }
            
            if([line hasPrefix:@"E"]){
                
               _quiz.Echoice = line;
                
            }
            if([line hasPrefix:@"F"]){
                
               _quiz.Fchoice = line;
                
            }

            if([line hasPrefix:@"Answer"]) {
                
                _quiz.Answer = line;
                
                [_quizarray addObject:_quiz];
                
               
                
                d = 0;
            }
            
            if([line hasPrefix:@"answer"]) {
                
                _quiz.Answer = line;
                
                [_quizarray addObject:_quiz];
                
              
                
                d = 0;
            }

            
            }
            
        
            }

     return newInstance;
            
        }
    

-(NSMutableArray*)returnQuizItems {

    return _quizarray;
    
   
}

-(int)returnScore : (NSMutableArray*)answers and : (NSMutableArray*)quizarray {
    int score = 0;
    for(int i=0;i < [answers count];i++ ) {
        QuizItem * quizforanswer = [[QuizItem alloc]init];
        quizforanswer = [quizarray objectAtIndex:i];
        
        NSString * quizanswer = [[answers objectAtIndex:i] stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString * answerquiz = [quizforanswer.Answer stringByReplacingOccurrencesOfString:@" " withString:@"" ];
        
        NSLog(@"%@",quizforanswer);
        if([quizanswer isEqualToString: answerquiz]) {
            
            score++;
        }
    
    }
    return score;
}


@end
