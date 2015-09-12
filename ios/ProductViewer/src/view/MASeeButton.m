//
//  MASeeButton.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MASeeButton.h"

#import "MAProduct.h"
#import "MASession.h"

@implementation MASeeButton

- (void)adjustForProduct:(MAProduct *)product {
  UIColor *seeColor = [UIColor colorWithRed:247.f/255.f
                                      green:114.f/255.f
                                       blue:116.f/255.f
                                      alpha:1.f];
  NSString *seeImage = @"icon_seen_ok";
  NSString *seeTitle = @"VISTO";
  
  if ([product isSeenBy:[MASession currentSession].user]) {
    seeColor = [UIColor colorWithRed:21.f/255.f
                               green:169.f/255.f
                                blue:159.f/255.f
                               alpha:1.f];
    seeImage = @"icon_seen_not_ok";
    seeTitle = @"NÃO VISTO";
  }
  
  [UIView animateWithDuration:0.15f animations:^{
    self.titleLabel.alpha = 0.5f;
    self.imageView.alpha = 0.5f;
    self.backgroundColor = seeColor;
  } completion:^(BOOL finished) {
    [self setImage:[UIImage imageNamed:seeImage]
          forState:UIControlStateNormal];
    [self setTitle:seeTitle
          forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.15f animations:^{
      self.titleLabel.alpha = 1.f;
      self.imageView.alpha = 1.f;
    }];
  }];
  
}

@end
