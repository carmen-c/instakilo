//
//  ViewController.m
//  InstaKilo
//
//  Created by carmen cheng on 2016-11-16.
//  Copyright © 2016 carmen cheng. All rights reserved.
//

#import "ViewController.h"
#import "CatImages.h"
#import "CatImagesCollectionViewCell.h"
#import "CatSubjects.h"
#import "HeadersCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) NSArray* catscollection;
@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    
    //self.catscollection = [NSArray arrayWithArray:[self prepareDataSource]];
    
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(100, 100);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.flowLayout.minimumInteritemSpacing = 15;
    self.flowLayout.minimumLineSpacing = 15;
    self.flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    
    self.collectionView.collectionViewLayout = self.flowLayout;
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.catscollection.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CatSubjects *catss = self.catscollection[section];
    return catss.cats.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CatImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"catCell" forIndexPath:indexPath];
    CatSubjects *catsub = self.catscollection[indexPath.section];
    
    CatImages *catimg = catsub.cats[indexPath.row];
    UIImage *thisImage = [UIImage imageNamed:catimg.catImage];
    cell.catImageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.catImageView.image = thisImage;
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeadersCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"catHeader" forIndexPath:indexPath];
        CatSubjects *catsubbs = self.catscollection[indexPath.section];
        headerView.catSubjectLabel.text = catsubbs.subject;
        return headerView;
        
    }
    return nil;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

-(void)setupData {
    self.catscollection = @[
            [CatSubjects catSubjectsWithSubject:@"Fat Cats" cats:@[
                    [CatImages catImagesWithCatImageName:@"cat1"],
                    [CatImages catImagesWithCatImageName:@"cat2"],
                    [CatImages catImagesWithCatImageName:@"cat3"],
                    [CatImages catImagesWithCatImageName:@"cat4"],
                    [CatImages catImagesWithCatImageName:@"cat5"]]],
            [CatSubjects catSubjectsWithSubject:@"Cute Cats" cats:@[
                    [CatImages catImagesWithCatImageName:@"cat6"],
                    [CatImages catImagesWithCatImageName:@"cat7"],
                    [CatImages catImagesWithCatImageName:@"cat8"],
                    [CatImages catImagesWithCatImageName:@"cat9"],
                    [CatImages catImagesWithCatImageName:@"cat10"]]]
                          ];
                            
}
    
@end
