//
//  CatImages.m
//  InstaKilo
//
//  Created by carmen cheng on 2016-11-16.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "CatImages.h"

@implementation CatImages

+ (instancetype)catImagesWithCatImageName:(NSString *)catImage{
    return [[self alloc] initWithCatImageName:catImage];
}

-(instancetype)initWithCatImageName:(NSString *)catImage{
    self = [super init];
    if (self){
        _catImage = catImage;
    }
    return self;
}
@end
