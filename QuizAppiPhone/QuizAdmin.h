//
//  QuizAdmin.h
//  QuizCline
//
//  Created by Saiteja Samudrala on 7/14/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FileMaster.h"

@interface QuizAdmin : NSObject
@property FileMaster * filemaster;;
@property NSMutableArray * qarray;
@property NSMutableArray * aarray;
@property NSUInteger score;
-(id)initWithPath : (NSString*)path;
-(void)setfile : (NSString*)path;
-(NSUInteger)returnscore;

@end
