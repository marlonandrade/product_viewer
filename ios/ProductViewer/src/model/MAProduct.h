//
//  MAProduct.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAUser.h"

@interface MAProduct : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *photoDetailUri;
@property (nonatomic, strong) NSString *photoListUri;
@property (nonatomic, strong) MAUser *user;

@end
