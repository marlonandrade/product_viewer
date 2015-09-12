//
//  UIImageView+WebImage.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "UIImageView+WebImage.h"

@import WebImage;

@implementation UIImageView (WebImage)

- (void)ma_setImageWithURL:(NSURL *)url {
  __block UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  activity.hidesWhenStopped = YES;
  activity.translatesAutoresizingMaskIntoConstraints = NO;
  [activity startAnimating];
  
  [self addSubview:activity];
  
  __block NSArray *constraints = @[
    [NSLayoutConstraint constraintWithItem:activity
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.f
                                  constant:0],
    [NSLayoutConstraint constraintWithItem:activity
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.f
                                  constant:0]
  ];
  [self addConstraints:constraints];
  
  [self sd_setImageWithURL:url
                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                   [self removeConstraints:constraints];
                   [activity removeFromSuperview];
                 }];
}

@end
