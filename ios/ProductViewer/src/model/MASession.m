//
//  MASession.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MASession.h"

@implementation MASession

+ (instancetype)currentSession {
  static MASession *_sharedInstance = nil;
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    // Initialize the instance when user logs in
    // deinitialize when user logs out
    
    _sharedInstance = [[MASession alloc] init];
    
    MAUser *user = [[MAUser alloc] init];
    user.uuid = @"my-current-user";
    
    _sharedInstance.user = user;
  });
  
  return _sharedInstance;
}

@end
