//
//  MALikeImageView.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MALikeImageView.h"

#import "MAProduct.h"
#import "MASession.h"

@implementation MALikeImageView

- (void)setImageForProduct:(MAProduct *)product {
  NSString *likeImage = @"icon_like";
  if ([product isLikedBy:[MASession currentSession].user]) {
    likeImage = [likeImage stringByAppendingString:@"_selected"];
  }
  
  [UIView animateWithDuration:0.15f animations:^{
    self.alpha = 0.5f;
  } completion:^(BOOL finished) {
    self.image = [UIImage imageNamed:likeImage];
    
    [UIView animateWithDuration:0.15f animations:^{
      self.alpha = 1.f;
    }];
  }];
}

@end
