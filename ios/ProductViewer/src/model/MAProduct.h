//
//  MAProduct.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAUser.h"

@import Mantle;

@interface MAProduct : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy, readonly) NSURL *photoDetailURL;
@property (nonatomic, copy, readonly) NSURL *photoListURL;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *price;

@property (nonatomic, strong) MAUser *user;

@end
