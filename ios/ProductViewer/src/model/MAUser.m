//
//  MAUser.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAUser.h"

#import "NSURL+URLEncoding.h"

@implementation MAUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{
    @"avatarURL": @"user_avatar",
    @"initials": @"user_iniciais",
    @"fullName": @"user_fullname"
  };
}

+ (NSValueTransformer *)avatarURLJSONTransformer {
  return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *stringUri, BOOL *success, NSError *__autoreleasing *error) {
    return [NSURL ma_URLWithNonEncodedString:stringUri];
  } reverseBlock:^id(NSURL* url, BOOL *success, NSError *__autoreleasing *error) {
    return url.absoluteString;
  }];
}

@end
