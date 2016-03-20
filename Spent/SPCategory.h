//
//  SPCategory.h
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SPTransaction;

NS_ASSUME_NONNULL_BEGIN

@interface SPCategory : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+ (void)checkAndCreateBasicEntities;
+ (double)returnTotal;
+ (double)returnCategoryTotal:(int)category;
+ (NSString *)returnCategoryName:(int)category;
+ (UIColor *)returnCategoryColor:(int)category;
+ (int)numberOfTotalCategories;

@end

NS_ASSUME_NONNULL_END

#import "SPCategory+CoreDataProperties.h"
