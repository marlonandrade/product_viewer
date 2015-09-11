//
//  MAProductsDataSource.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductsDataSource.h"

#import "MAProduct.h"
#import "MAUser.h"

@import AFNetworking;

static NSString *const kProductsUri = @"https://gist.githubusercontent.com/caironoleto/15f71c091fb4725abc8a/raw/5bdca1c267b63c344d7b9d9c0f92ad8df9a38ecb/data.json";

@implementation MAProductsDataSource

- (void)fetchProducts:(MAProductsSuccessCallback)successCallback
                error:(MAProductsErrorCallback)errorCallback {
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
  
  [manager GET:kProductsUri
    parameters:nil
       success:^(AFHTTPRequestOperation *operation, NSArray* responseObjects) {
         NSError *error;
         NSArray* products = [MTLJSONAdapter modelsOfClass:[MAProduct class]
                                             fromJSONArray:responseObjects
                                                     error:&error];
         if (error) {
           NSLog(@"Error: %@", error);
         }
         
         successCallback(products);
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"ERROR %@", error);
         errorCallback(error);
       }];
}

@end
