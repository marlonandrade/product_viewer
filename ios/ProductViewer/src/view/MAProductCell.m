//
//  MAProductCell.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductCell.h"

#import "MAProduct.h"

@import WebImage;

@interface MAProductCell ()

- (void)_setImageWithURL:(NSURL*)url toImageView:(UIImageView*)imageView;

@end

@implementation MAProductCell

#pragma mark - Setter

- (void)setProduct:(MAProduct *)product {
  [self _setImageWithURL:product.photoListURL toImageView:self.picture];
  
  self.title.text = product.title;
  self.price.text = product.price;
  
  [self _setImageWithURL:product.user.avatarURL toImageView:self.userPicture];
}

#pragma mark - View Lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  
  self.userPicture.layer.cornerRadius = CGRectGetWidth(self.userPicture.bounds) / 2;
  self.userPicture.clipsToBounds = YES;
}

#pragma mark - Private Interface

- (void)_setImageWithURL:(NSURL *)url toImageView:(UIImageView *)imageView {
  __block UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
  activity.center = imageView.center;
  activity.hidesWhenStopped = YES;
  [activity startAnimating];
  [imageView.superview addSubview:activity];
  
  [imageView sd_setImageWithURL:url
                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                        [activity removeFromSuperview];
                      }];
}

@end
