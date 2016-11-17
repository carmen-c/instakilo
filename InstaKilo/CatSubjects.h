//
//  CatSubjects.h
//  InstaKilo
//
//  Created by carmen cheng on 2016-11-16.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatSubjects : NSObject
@property (nonatomic) NSString *subject;
@property (nonatomic) NSArray *cats;

-(instancetype)initWithSubject:(NSString *)subject cats:(NSArray *)cats;
+ (instancetype)catSubjectsWithSubject:(NSString *)subject cats:(NSArray *)cats;
@end
