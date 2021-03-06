//
//  MAProductsViewController.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductsViewController.h"

#import "MAProduct.h"
#import "MASession.h"
#import "MAProductCell.h"
#import "MAProductDetailViewController.h"
#import "MAProductsDataSource.h"

@interface MAProductsViewController () <UICollectionViewDelegateFlowLayout, MAProductCellLikeDelegate>

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
  
  __block UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  activity.center = self.view.center;
  activity.hidesWhenStopped = YES;
  [activity startAnimating];
  [self.view addSubview:activity];
  
  [self.productsDataSource fetchProducts:^(NSArray *products) {
    [activity removeFromSuperview];
    self.products = products;
    [self.collectionView reloadData];
  } error:^(NSError *error) {
    NSLog(@"Look at error");
  }];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  NSArray *selectedIndexPaths = [self.collectionView indexPathsForSelectedItems];
  [self.collectionView reloadItemsAtIndexPaths:selectedIndexPaths];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue.destinationViewController isKindOfClass:[MAProductDetailViewController class]]) {
    MAProductDetailViewController *detailViewController = (MAProductDetailViewController *)segue.destinationViewController;
    MAProductCell *cell = (MAProductCell *)sender;
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    MAProduct *product = self.products[indexPath.row];
    
    detailViewController.product = product;
  }
}

#pragma mark - UICollectionViewDataSource

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
  
  cell.likeDelegate = self;
  cell.product = self.products[indexPath.row];
  
  return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

int const kProductHeight = 260;
int const kProductColumns = 2;

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
  
  UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionViewLayout;
  
  CGFloat width = CGRectGetWidth(collectionView.bounds) -
      (flowLayout.minimumInteritemSpacing * (kProductColumns - 1)) -
      (flowLayout.sectionInset.left + flowLayout.sectionInset.right);
  
  return CGSizeMake(width / kProductColumns, kProductHeight);
}

#pragma mark - MAProductCellLikeDelegate

- (void)productCellToggleLike:(MAProductCell *)cell {
  NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
  MAProduct *product = self.products[indexPath.row];
  [product toggleLikedWith:[MASession currentSession].user
                   success:^(MAProduct *product) {
                     [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
                   } error:^(NSError *error) {
                     NSLog(@"Error: %@", error);
                   }];
}

@end
