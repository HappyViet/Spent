//
//  SPTransaction+CoreDataProperties.h
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SPTransaction.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPTransaction (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *amountSpent;
@property (nullable, nonatomic, retain) NSDate *dateSpent;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSManagedObject *category;

@end

NS_ASSUME_NONNULL_END
