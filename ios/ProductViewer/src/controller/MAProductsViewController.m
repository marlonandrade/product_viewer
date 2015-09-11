//
//  MAProductsViewController.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductsViewController.h"

#import "MAProductCell.h"

#import "MAProductsDataSource.h"

@interface MAProductsViewController () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *products;
@property (nonatomic, strong) MAProductsDataSource *productsDataSource;

@end

@implementation MAProductsViewController

#pragma mark - Getter

- (MAProductsDataSource *)productsDataSource {
  if (!_productsDataSource) {
    _productsDataSource = [[MAProductsDataSource alloc] init];
  }
  return _productsDataSource;
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSString *identifier = NSStringFromClass([MAProductCell class]);
  [self.collectionView registerNib:[UINib nibWithNibName:identifier bundle:nil]
        forCellWithReuseIdentifier:identifier];
  
  [self.productsDataSource fetchProducts:^(NSArray *products) {
    self.products = products;
    [self.collectionView reloadData];
  } error:^(NSError *error) {
    NSLog(@"Look at error");
  }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  MAProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MAProductCell class])
                                                                  forIndexPath:indexPath];
  
  cell.product = self.products[indexPath.row];
  
  return cell;
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

#pragma mark - UICollectionViewDelegateFlowLayout

int const ProductHeight = 238;
int const ProductColumns = 2;

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
  
  UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionViewLayout;
  
  CGFloat width = CGRectGetWidth(collectionView.bounds) -
      (flowLayout.minimumInteritemSpacing * (ProductColumns - 1)) -
      (flowLayout.sectionInset.left + flowLayout.sectionInset.right);
  
  return CGSizeMake(width / ProductColumns, ProductHeight);
}

@end
