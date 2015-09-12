//
//  UIView+Bordered.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "UIView+Bordered.h"

@implementation UIView (Bordered)

- (void)ma_addBorderWithColor:(UIColor *)color width:(CGFloat)width {
  self.layer.borderColor = color.CGColor;
  self.layer.borderWidth = width;
}

@end
