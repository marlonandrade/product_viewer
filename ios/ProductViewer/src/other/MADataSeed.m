//
//  MADataSeed.m
//  ProductViewer
//
//  Created by Marlon Andrade on 9/12/15.
//  Copyright © 2015 Marlon Andrade. All rights reserved.
//

#import "MADataSeed.h"

#import "MALike.h"

@interface MADataSeed ()

@property (nonatomic, readonly) NSArray *productsIds;
@property (nonatomic, readonly) NSArray *userIds;

- (void)_seedProductsLikes;
- (NSArray *)_pickRandomUsers;

@end

@implementation MADataSeed

#pragma mark - Getter

- (NSArray *)productsIds {
  return @[
    @"55f0aeed3ee24b19ac652270",
    @"55f0aeed095812744568bb31",
    @"55f0aeedfa2a9401e2ed17e1",
    @"55f0aeed455b69ca5ad66c3d",
    @"55f0aeedb55434b632701b7f",
    @"55f0aeed3909a61d022a868d",
    @"55f0aeedf97704ea1c5fdde6",
    @"55f0aeed97dd49a7a6151429",
    @"55f0aeed1f0f38749aa75388",
    @"55f0aeed503ccee2d5fe7c03",
    @"55f0aeed604bf21df934602f",
    @"55f0aeedc0c4d94814d010ae",
    @"55f0aeedee1929ba8e8b73e1",
    @"55f0aeed3da1d960f9d6f4a0",
    @"55f0aeed0dad1e03f1698389"
  ];
}

- (NSArray *)userIds {
  return @[
    @"f4456078-5952-11e5-885d-feff819cdc9f",
    @"f4456488-5952-11e5-885d-feff819cdc9f",
    @"f4456622-5952-11e5-885d-feff819cdc9f",
    @"f4456780-5952-11e5-885d-feff819cdc9f",
    @"f44568de-5952-11e5-885d-feff819cdc9f",
    @"f4456dde-5952-11e5-885d-feff819cdc9f",
    @"f4456f64-5952-11e5-885d-feff819cdc9f",
    @"f44570c2-5952-11e5-885d-feff819cdc9f",
    @"f4457216-5952-11e5-885d-feff819cdc9f",
    @"f4457360-5952-11e5-885d-feff819cdc9f",
    @"f44574aa-5952-11e5-885d-feff819cdc9f",
    @"f44578e2-5952-11e5-885d-feff819cdc9f",
    @"f4457a4a-5952-11e5-885d-feff819cdc9f",
    @"f4457b94-5952-11e5-885d-feff819cdc9f",
    @"f4457ce8-5952-11e5-885d-feff819cdc9f",
    @"f4457eb4-5952-11e5-885d-feff819cdc9f",
    @"f4458346-5952-11e5-885d-feff819cdc9f",
    @"f44584ae-5952-11e5-885d-feff819cdc9f",
    @"f44585f8-5952-11e5-885d-feff819cdc9f",
    @"f4458742-5952-11e5-885d-feff819cdc9f",
    @"f44588a0-5952-11e5-885d-feff819cdc9f",
    @"f44589fe-5952-11e5-885d-feff819cdc9f",
    @"f4458eea-5952-11e5-885d-feff819cdc9f",
    @"f4459084-5952-11e5-885d-feff819cdc9f",
    @"f44591ce-5952-11e5-885d-feff819cdc9f",
    @"f4459318-5952-11e5-885d-feff819cdc9f",
    @"f4459458-5952-11e5-885d-feff819cdc9f",
    @"f44595b6-5952-11e5-885d-feff819cdc9f",
    @"f44599f8-5952-11e5-885d-feff819cdc9f",
    @"f4459b60-5952-11e5-885d-feff819cdc9f",
    @"f4459caa-5952-11e5-885d-feff819cdc9f",
    @"f4459dea-5952-11e5-885d-feff819cdc9f",
    @"f4459f2a-5952-11e5-885d-feff819cdc9f",
    @"f445a074-5952-11e5-885d-feff819cdc9f",
    @"f445a420-5952-11e5-885d-feff819cdc9f",
    @"f445a5f6-5952-11e5-885d-feff819cdc9f",
    @"f445a74a-5952-11e5-885d-feff819cdc9f",
    @"f445ab3c-5952-11e5-885d-feff819cdc9f",
    @"f445add0-5952-11e5-885d-feff819cdc9f",
    @"f445b050-5952-11e5-885d-feff819cdc9f"
  ];
}

#pragma mark - Public Interface

+ (void)seedInitialData {
  if ([MALike MR_countOfEntities] == 0) {
    NSLog(@"Seeding some likes");
    MADataSeed *seeder = [[MADataSeed alloc] init];
    [seeder _seedProductsLikes];
  }
}

#pragma mark - Private Interface

- (void)_seedProductsLikes {
  [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
    [self.productsIds enumerateObjectsUsingBlock:^(NSString *productId, NSUInteger idx, BOOL *stop) {
      NSArray *users = [self _pickRandomUsers];
      [users enumerateObjectsUsingBlock:^(NSString  *userId, NSUInteger idx, BOOL *stop) {
        MALike *like = [MALike MR_createEntityInContext:localContext];
        like.product_uuid = productId;
        like.user_uuid = userId;
      }];
    }];
  }];
}

- (NSArray *)_pickRandomUsers {
  NSMutableArray *users = [[NSMutableArray alloc] initWithArray:self.userIds];
  
  int randomAmount = (arc4random() % users.count);
  
  while (users.count > randomAmount) {
    int randomIndex = (arc4random() % users.count);
    [users removeObjectAtIndex:randomIndex];
  }
  
  return users;
}

@end