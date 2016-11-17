//
//  CatImagesCollectionViewCell.h
//  InstaKilo
//
//  Created by carmen cheng on 2016-11-16.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatImages.h"

@interface CatImagesCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;
@property (nonatomic) CatImages *cat;
-(void)configureCellWithCat:(CatImages *)cat;
@end
