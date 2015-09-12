//
//  MAProductDetailViewController.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MAProductDetailViewController.h"

#import "MASession.h"
#import "MASeeButton.h"
#import "UIImageView+WebImage.h"
#import "UIView+Bordered.h"
#import "UIView+Rounded.h"

@interface MAProductDetailViewController ()

@end

@implementation MAProductDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIColor *borderColor = [UIColor colorWithRed:232.f/255.f
                                         green:231.f/255.f
                                          blue:231.f/255.f
                                         alpha:1.f];
  CGFloat borderWidth = 1.f;
  
  [self.userPictureRoundedContainer ma_makeRounded];
  [self.userPictureRoundedContainer ma_addBorderWithColor:borderColor
                                                    width:borderWidth];
  
  [self.likeRoundedContainer ma_makeRounded];
  [self.likeRoundedContainer ma_addBorderWithColor:borderColor
                                             width:borderWidth];
  
  [self.photoImageView ma_setImageWithURL:self.product.photoDetailURL];
  self.priceLabel.text = self.product.price;
  [self.userPictureImageView ma_setImageWithURL:self.product.user.avatarURL];
  [self.likeIconImageView setImageForProduct:self.product];
  [self.seeButton adjustForProduct:self.product];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBActions

- (IBAction)toggleLike:(id)sender {
  [self.product toggleLikedWith:[MASession currentSession].user
                        success:^(MAProduct *product) {
                          [self.likeIconImageView setImageForProduct:product];
                        } error:^(NSError *error) {
                          NSLog(@"Error: %@", error);
                        }];
}

- (IBAction)toogleSee:(id)sender {
  [self.product toogleSeenWith:[MASession currentSession].user
                       success:^(MAProduct *product) {
                         [self.seeButton adjustForProduct:product];
                       } error:^(NSError *error) {
                         NSLog(@"Error: %@", error);
                       }];
}

@end
