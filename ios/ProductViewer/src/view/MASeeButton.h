//
//  MASeeButton.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MAProduct;

@interface MASeeButton : UIButton

- (void)adjustForProduct:(MAProduct *)product;

@end
