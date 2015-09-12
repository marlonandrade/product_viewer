//
//  MAProductCell.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MAProduct;
@class MAProductCell;

@protocol MAProductCellLikeDelegate <NSObject>

@required
- (void)productCellToggleLike:(MAProductCell *)cell;

@end

@interface MAProductCell : UICollectionViewCell

@property (nonatomic, weak) id<MAProductCellLikeDelegate> likeDelegate;
@property (nonatomic, weak) MAProduct* product;

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *userPicture;
@property (weak, nonatomic) IBOutlet UILabel *likeCount;
@property (weak, nonatomic) IBOutlet UIImageView *likeIcon;

@end

