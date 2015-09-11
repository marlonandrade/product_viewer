//
//  MAProduct.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProduct.h"

#import "NSURL+URLEncoding.h"

@implementation MAProduct

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{
    @"photoDetailURL": @"product_photo_on_detail",
    @"photoListURL": @"product_photo_on_list",
    @"title": @"product_title",
    @"price": @"product_price",
    @"user": @[
      @"user_avatar",
      @"user_iniciais",
      @"user_fullname"
    ]
  };
}

+ (NSValueTransformer *)photoDetailURLJSONTransformer {
  return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringUri, BOOL *success, NSError *__autoreleasing *error) {
    return [NSURL ma_URLWithNonEncodedString:stringUri];
  } reverseBlock:^id(NSURL* url, BOOL *success, NSError *__autoreleasing *error) {
    return url.absoluteString;
  }];
}

+ (NSValueTransformer *)photoListURLJSONTransformer {
  return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringUri, BOOL *success, NSError *__autoreleasing *error) {
    return [NSURL ma_URLWithNonEncodedString:stringUri];
  } reverseBlock:^id(NSURL* url, BOOL *success, NSError *__autoreleasing *error) {
    return url.absoluteString;
  }];
}

+ (NSValueTransformer *)userJSONTransformer {
  return [MTLValueTransformer transformerUsingForwardBlock:^id(NSDictionary *userDictionary, BOOL *success, NSError *__autoreleasing *error) {
    return [MTLJSONAdapter modelOfClass:[MAUser class]
                     fromJSONDictionary:userDictionary
                                  error:nil];
  } reverseBlock:^id(MAUser *user, BOOL *success, NSError *__autoreleasing *error) {
    return [MTLJSONAdapter JSONDictionaryFromModel:user
                                             error:nil];
  }];
}

@end
