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
@property (nonatomic) UICollectionViewFlowLayout *groupLayout;
@property (nonatomic) UICollectionViewFlowLayout *allLayout;
@property (nonatomic) NSArray* catscollection;
@end

@implementation ViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupLayout];
    
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

#pragma mark - segment control

- (IBAction)segmentControls:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        [self.collectionView.collectionViewLayout invalidateLayout];
        [self.collectionView setCollectionViewLayout:self.groupLayout animated:YES];
        
    } else if (sender.selectedSegmentIndex == 1) {
        [self.collectionView.collectionViewLayout invalidateLayout];
        [self.collectionView setCollectionViewLayout:self.allLayout animated:YES];
    }
}


#pragma mark - set up


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

-(void)setupLayout {
    
    self.groupLayout = [[UICollectionViewFlowLayout alloc] init];
    self.groupLayout.itemSize = CGSizeMake(100, 100);
    self.groupLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.groupLayout.minimumLineSpacing = 5;
    self.groupLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    
    self.allLayout = [[UICollectionViewFlowLayout alloc] init];
    self.allLayout.itemSize = CGSizeMake(100, 100);
    self.allLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.allLayout.minimumLineSpacing = 5;
}
    
@end
