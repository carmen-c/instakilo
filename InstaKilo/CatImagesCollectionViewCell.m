//
//  CatImagesCollectionViewCell.m
//  InstaKilo
//
//  Created by carmen cheng on 2016-11-16.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "CatImagesCollectionViewCell.h"

@interface CatImagesCollectionViewCell()
@end

@implementation CatImagesCollectionViewCell


-(void)configureCellWithCat:(CatImages *)cat{
    
    self.catImageView.image = [UIImage imageNamed:cat.catImage];
    
}
@end
