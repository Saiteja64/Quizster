//
//  FileMaster.h
//  QuizCline
//
//  Created by Saiteja Samudrala on 7/14/14.
//  Copyright (c) 2014 Urbanoid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuizItem.h"

@interface FileMaster : NSObject

@property (nonatomic) NSFileHandle * handle;
@property (nonatomic) NSMutableArray * quizarray;

-(id)initWithPath : (NSString*)path;
-(NSMutableArray*)returnQuizItems;
-(int)returnScore : (NSMutableArray*)answers and: (NSMutableArray*)quizarray;
@end