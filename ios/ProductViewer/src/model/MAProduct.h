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

@class MAProduct;

typedef void (^MALikeSuccessCallback)(MAProduct *product);
typedef void (^MALikeErrorCallback)(NSError *error);

typedef void (^MASeeSuccessCallback)(MAProduct *product);
typedef void (^MASeeErrorCallback)(NSError *error);

@interface MAProduct : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy, readonly) NSURL *photoDetailURL;
@property (nonatomic, copy, readonly) NSURL *photoListURL;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *price;

@property (nonatomic, strong) MAUser *user;

- (NSNumber *)likeCount;
- (BOOL)isLikedBy:(MAUser *)user;
- (void)toggleLikedWith:(MAUser *)user
                success:(MALikeSuccessCallback)successCallback
                  error:(MALikeErrorCallback)errorCallback;

- (BOOL)isSeenBy:(MAUser *)user;
- (void)toogleSeenWith:(MAUser *)user
               success:(MASeeSuccessCallback)successCallback
                 error:(MASeeErrorCallback)errorCallback;

@end
