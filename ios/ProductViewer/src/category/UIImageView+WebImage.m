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
  activity.center = self.center;
  activity.hidesWhenStopped = YES;
  [activity startAnimating];
  [self.superview addSubview:activity];
  
  [self sd_setImageWithURL:url
                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                   [activity removeFromSuperview];
                 }];
}

@end
