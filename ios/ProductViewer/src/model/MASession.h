//
//  MASession.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MAUser.h"

@interface MASession : NSObject

@property (nonatomic, strong) MAUser *user;

+ (instancetype)currentSession;

@end
