//
//  SPCategory+CoreDataProperties.h
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SPCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPCategory (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *color;
@property (nullable, nonatomic, retain) NSNumber *total;
@property (nullable, nonatomic, retain) NSSet<SPTransaction *> *transactions;

@end

@interface SPCategory (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(SPTransaction *)value;
- (void)removeTransactionsObject:(SPTransaction *)value;
- (void)addTransactions:(NSSet<SPTransaction *> *)values;
- (void)removeTransactions:(NSSet<SPTransaction *> *)values;

@end

NS_ASSUME_NONNULL_END
