//
//  CatImages.h
//  InstaKilo
//
//  Created by carmen cheng on 2016-11-16.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CatImages : NSObject
@property (nonatomic) NSString *catImage;

//-(instancetype)initWithCatImageName:(NSString *)catImage;
+ (instancetype)catImagesWithCatImageName:(NSString *)catImage;
@end
