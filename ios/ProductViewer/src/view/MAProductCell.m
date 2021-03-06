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
#import "UIView+Rounded.h"

@interface MAProductCell ()

@end

@implementation MAProductCell

#pragma mark - Setter

- (void)setProduct:(MAProduct *)product {
  [self.picture ma_setImageWithURL:product.photoListURL];
  self.title.text = product.title;
  self.price.text = product.price;
  
  [self.userPicture ma_setImageWithURL:product.user.avatarURL];
  
  self.likeCount.text = [product.likeCount stringValue];
  [self.likeIcon setImageForProduct:product];
}

#pragma mark - View Lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  
  [self.userPicture ma_makeRounded];
}

#pragma mark - IBActions

- (IBAction)toggleLike:(UIButton *)sender {
  if (self.likeDelegate) {
    [self.likeDelegate productCellToggleLike:self];
  }
}

@end
