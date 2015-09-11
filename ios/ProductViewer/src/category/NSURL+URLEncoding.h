//
//  NSURL+URLEncoding.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (URLEncoding)

+ (NSURL *)ma_URLWithNonEncodedString:(NSString *)urlString;

@end
