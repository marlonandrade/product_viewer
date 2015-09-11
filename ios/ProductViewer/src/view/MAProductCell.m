//
//  MAProductCell.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductCell.h"

#import "MAProduct.h"
#import "NSURL+URLEncoding.h"

@import WebImage;

@implementation MAProductCell

#pragma mark - Setter

- (void)setProduct:(MAProduct *)product {
  NSURL *url = [NSURL ma_URLWithNonEncodedString:product.photoListUri];
  [self.picture sd_setImageWithURL:url];
  
  self.title.text = product.title;
  self.price.text = product.price;
}

@end
