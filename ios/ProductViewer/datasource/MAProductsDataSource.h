//
//  MAProductsDataSource.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MAProductsSuccessCallback)(NSArray* products);
typedef void (^MAProductsErrorCallback)(NSError* error);

@interface MAProductsDataSource : NSObject

- (void)fetchProducts:(MAProductsSuccessCallback)successCallback
                error:(MAProductsErrorCallback)errorCallback;

@end
