//
//  MAUser.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

@import Mantle;

@interface MAUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSURL *avatarURL;
@property (nonatomic, copy) NSString *initials;
@property (nonatomic, copy) NSString *fullName;

@end
