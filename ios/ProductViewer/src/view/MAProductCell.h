//
//  MAProductCell.h
//  ProductViewer
//
//  Created by Marlon Andrade on 9/11/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MAProduct;

@interface MAProductCell : UICollectionViewCell

@property (nonatomic, weak) MAProduct* product;

@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *userPicture;

@end
