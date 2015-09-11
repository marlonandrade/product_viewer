//
//  MAUser.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAUser : NSObject

@property (nonatomic, strong) NSString *avatarUri;
@property (nonatomic, strong) NSString *initials;
@property (nonatomic, strong) NSString *fullName;

@end
