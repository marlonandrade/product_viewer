//
//  NSURL+URLEncoding.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "NSURL+URLEncoding.h"

#import "NSString+URLEncoding.h"

@implementation NSURL (URLEncoding)

+ (NSURL *)ma_URLWithNonEncodedString:(NSString *)urlString {
  return [NSURL URLWithString:urlString.ma_urlEncode];
}

@end
