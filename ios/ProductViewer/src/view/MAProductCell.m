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
  NSURL *pictureURL = [NSURL ma_URLWithNonEncodedString:product.photoListUri];
  [self.picture sd_setImageWithURL:pictureURL];
  
  self.title.text = product.title;
  self.price.text = product.price;
  
  NSURL *userPictureURL = [NSURL ma_URLWithNonEncodedString:product.user.avatarUri];
  [self.userPicture sd_setImageWithURL:userPictureURL];
}

#pragma mark - View Lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  
  self.userPicture.layer.cornerRadius = CGRectGetWidth(self.userPicture.bounds) / 2;
  self.userPicture.clipsToBounds = YES;
}

@end
