//
//  MAProductDetailViewController.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MALikeImageView.h"
#import "MAProduct.h"
#import "MASeeButton.h"

@interface MAProductDetailViewController : UIViewController

@property (nonatomic, strong) MAProduct *product;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIView *userPictureRoundedContainer;
@property (weak, nonatomic) IBOutlet UIImageView *userPictureImageView;
@property (weak, nonatomic) IBOutlet UIView *likeRoundedContainer;
@property (weak, nonatomic) IBOutlet MALikeImageView *likeIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet MASeeButton *seeButton;

@end
