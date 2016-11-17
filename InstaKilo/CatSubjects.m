//
//  CatSubjects.m
//  InstaKilo
//
//  Created by carmen cheng on 2016-11-16.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "CatSubjects.h"

@implementation CatSubjects

+ (instancetype)catSubjectsWithSubject:(NSString *)subject cats:(NSArray *)cats {
    return [[self alloc] initWithSubject:subject cats:cats];
}


-(instancetype)initWithSubject:(NSString *)subject cats:(NSArray *)cats{
    self = [super init];
    if (self){
    _subject = subject;
    _cats = cats;
    }
    return self;
}

@end
