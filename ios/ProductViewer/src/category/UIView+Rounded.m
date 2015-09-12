//
//  UIView+Rounded.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "UIView+Rounded.h"

@implementation UIView (Rounded)

- (void)ma_makeRounded {
  self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
  self.clipsToBounds = YES;
}

@end
