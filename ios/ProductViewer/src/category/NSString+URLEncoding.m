//
//  NSString+URLEncoding.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)

- (NSString *)ma_urlEncode {
  NSCharacterSet *urlCharset = [NSCharacterSet URLQueryAllowedCharacterSet];
  return [self stringByAddingPercentEncodingWithAllowedCharacters:urlCharset];
}

@end
