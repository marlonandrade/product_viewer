//
//  MAProduct.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProduct.h"

#import "MALike.h"
#import "MAUser.h"
#import "MASee.h"
#import "NSURL+URLEncoding.h"

@interface MAProduct ()

- (NSPredicate *)_predicateWithProductAndUser:(MAUser *)user;

@end

@implementation MAProduct

#pragma mark - Public Interface

- (NSNumber *)likeCount {
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"product_uuid = %@", self.uuid];
  return [MALike MR_numberOfEntitiesWithPredicate:predicate];
  
}

- (BOOL)isLikedBy:(MAUser *)user {
  NSPredicate *predicate = [self _predicateWithProductAndUser:user];
  return ![[MALike MR_numberOfEntitiesWithPredicate:predicate] isEqual:@0];
}

- (void)toggleLikedWith:(MAUser *)user
                success:(MALikeSuccessCallback)successCallback
                  error:(MALikeErrorCallback)errorCallback {
  [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
    if ([self isLikedBy:user]) {
      NSPredicate *predicate = [self _predicateWithProductAndUser:user];
      [MALike MR_deleteAllMatchingPredicate:predicate
                                  inContext:localContext];
    } else {
      MALike *like = [MALike MR_createEntityInContext:localContext];
      like.product_uuid = self.uuid;
      like.user_uuid = user.uuid;
    }
  } completion:^(BOOL contextDidSave, NSError *error) {
    if (error) {
      errorCallback(error);
    } else {
      successCallback(self);
    }
  }];
}

- (BOOL)isSeenBy:(MAUser *)user {
  NSPredicate *predicate = [self _predicateWithProductAndUser:user];
  return ![[MASee MR_numberOfEntitiesWithPredicate:predicate] isEqual:@0];
}

- (void)toogleSeenWith:(MAUser *)user
               success:(MASeeSuccessCallback)successCallback
                 error:(MASeeErrorCallback)errorCallback {
  [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
    if ([self isSeenBy:user]) {
      NSPredicate *predicate = [self _predicateWithProductAndUser:user];
      [MASee MR_deleteAllMatchingPredicate:predicate
                                 inContext:localContext];
    } else {
      MASee *see = [MASee MR_createEntityInContext:localContext];
      see.product_uuid = self.uuid;
      see.user_uuid = user.uuid;
    }
  } completion:^(BOOL contextDidSave, NSError *error) {
    if (error) {
      errorCallback(error);
    } else {
      successCallback(self);
    }
  }];
}

#pragma mark - Private Interface

- (NSPredicate *)_predicateWithProductAndUser:(MAUser *)user {
  return [NSPredicate predicateWithFormat:@"product_uuid = %@ AND user_uuid = %@", self.uuid, user.uuid];
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return @{
    @"uuid": @"_id",
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
