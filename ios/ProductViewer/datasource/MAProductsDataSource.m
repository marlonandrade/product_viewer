//
//  MAProductsDataSource.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductsDataSource.h"

#import "MAProduct.h"
#import "MAUser.h"

@implementation MAProductsDataSource

- (void)fetchProducts:(MAProductsSuccessCallback)success
                error:(MAProductsErrorCallback)error {
  // do some requests
  
  MAProduct *product = [[MAProduct alloc] init];
  product.title = @"SIT ET";
  product.price = @"$271.98";
  product.photoDetailUri = @"http://placehold.it/320x370/e85657/ffffff/&text=SIT ET";
  product.photoListUri = @"http://placehold.it/168x213/f77274/ffffff/&text=SIT ET";
  
  MAUser *user = [[MAUser alloc] init];
  user.avatarUri = @"http://placehold.it/32/4597CE/F7E42D/&text=FS";
  user.initials = @"FS";
  user.fullName = @"Frank Simpson";
  
  product.user = user;
  
  NSArray *products = @[
    product,
    product,
    product,
    product,
    product,
    product,
    product
  ];
  
  success(products);
}

@end
