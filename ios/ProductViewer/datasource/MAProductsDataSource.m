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
  
  NSArray *products = @[
    [[MAProduct alloc] init],
    [[MAProduct alloc] init],
    [[MAProduct alloc] init],
    [[MAProduct alloc] init],
    [[MAProduct alloc] init],
    [[MAProduct alloc] init],
    [[MAProduct alloc] init]
  ];
  
  success(products);
}

@end
