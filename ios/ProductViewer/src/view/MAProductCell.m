//
//  MAProductCell.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductCell.h"

#import "MAProduct.h"
#import "UIImageView+WebImage.h"

@interface MAProductCell ()

@end

@implementation MAProductCell

#pragma mark - Setter

- (void)setProduct:(MAProduct *)product {
  [self.picture ma_setImageWithURL:product.photoListURL];
  self.title.text = product.title;
  self.price.text = product.price;
  
  [self.userPicture ma_setImageWithURL:product.user.avatarURL];
}

#pragma mark - View Lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  
  self.userPicture.layer.cornerRadius = CGRectGetWidth(self.userPicture.bounds) / 2;
  self.userPicture.clipsToBounds = YES;
}

@end
