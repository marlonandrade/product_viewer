//
//  MANavigationBar.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MANavigationBar.h"

@interface MANavigationBar ()

- (void)_setupLogo;

@end

@implementation MANavigationBar

#pragma mark - View Lifecycle

- (void)awakeFromNib {
  [super awakeFromNib];
  
  [self _setupLogo];
}

#pragma mark - Private Interface

- (void)_setupLogo {
  UIImage *logo = [UIImage imageNamed:@"logo_nav"];
  UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logo];
  logoImageView.center = self.center;
  
  [self addSubview:logoImageView];
}

@end
