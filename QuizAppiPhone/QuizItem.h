//
//  QuizItem.h
//  QuizAppiPhone
//
//  Created by Saiteja Samudrala on 7/17/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizItem : NSObject
@property (nonatomic) NSString * Question;
@property (nonatomic) NSString * Answer;
@property (nonatomic) NSString * Achoice;
@property (nonatomic) NSString * Bchoice;
@property (nonatomic) NSString * Cchoice;
@property (nonatomic) NSString * Dchoice;
@property (nonatomic) NSString * Echoice;
@property (nonatomic) NSString * Fchoice;

-(id)init;
-(NSString*)description;

@end
