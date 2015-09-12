//
//  MAProductShareViewController.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductShareViewController.h"

#import "MASession.h"
#import "UIImageView+WebImage.h"
#import "UIView+Rounded.h"
#import "NSString+URLEncoding.h"

@interface MAProductShareViewController ()

- (NSString *)_shareText;
- (void)_openUrl:(NSString *)urlString;

@end

@implementation MAProductShareViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.userPictureImageView ma_makeRounded];
  
  [self.pictureImageView ma_setImageWithURL:self.product.photoListURL];
  self.titleLabel.text = self.product.title;
  self.priceLabel.text = self.product.price;
  
  [self.userPictureImageView ma_setImageWithURL:self.product.user.avatarURL];
  
  self.likeCountLabel.text = [self.product.likeCount stringValue];
  [self.likeIconImageView setImageForProduct:self.product];
}

#pragma mark - IBActions

- (IBAction)toggleLike:(id)sender {
  [self.product toggleLikedWith:[MASession currentSession].user
                        success:^(MAProduct *product) {
                          [self.likeIconImageView setImageForProduct:product];
                        } error:^(NSError *error) {
                          NSLog(@"Error: %@", error);
                        }];
}

- (IBAction)shareWhatsapp:(id)sender {
  NSString *textEscaped = [self _shareText];
  NSString *url = [NSString stringWithFormat:@"whatsapp://send?text=%@", textEscaped];
  [self _openUrl:url];
}

- (IBAction)shareSMS:(id)sender {
  NSString *textEscaped = [self _shareText];
  NSString *url = [NSString stringWithFormat:@"sms:?body=%@", textEscaped];
  [self _openUrl:url];
}

#pragma mark - Private Interface

- (NSString *)_shareText {
  return [@"Hey check this product at Enjoei :P" ma_urlEncode];
}

- (void)_openUrl:(NSString *)urlString {
  NSURL *url = [NSURL URLWithString:urlString];
  if ([[UIApplication sharedApplication] canOpenURL:url]) {
    [[UIApplication sharedApplication] openURL:url];
  }
}

@end
