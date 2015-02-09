//
//  QuizItem.m
//  QuizAppiPhone
//
//  Created by Saiteja Samudrala on 7/17/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import "QuizItem.h"

@implementation QuizItem

-(NSString*)description {
    
    
    NSString * string = [NSString stringWithFormat:@"Quiz Item with the question %@ , choices %@ %@ %@ %@ %@ %@ and answer %@", _Question,_Achoice, _Bchoice,_Cchoice,_Dchoice,_Echoice,_Fchoice,_Answer];
    
    return string;
}



-(id)init {
    
    id newInstance =[super init];
    if(newInstance){
        
        _Answer = [[NSString alloc]init];
          _Question = [[NSString alloc]init];
        _Achoice = [[NSString alloc]init];
        _Achoice = @"";
        _Bchoice = [[NSString alloc]init];
         _Bchoice = @"";
        _Cchoice = [[NSString alloc]init];
         _Cchoice = @"";
        _Dchoice = [[NSString alloc]init];
         _Dchoice = @"";
        _Echoice = [[NSString alloc]init];
         _Echoice = @"";
        _Fchoice = [[NSString alloc]init];
         _Fchoice = @"";
        
    }
    return newInstance;
}


@end
