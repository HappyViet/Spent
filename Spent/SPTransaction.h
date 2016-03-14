//
//  SPTransaction.h
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface SPTransaction : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+ (instancetype)buildTransactionFromDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END

#import "SPTransaction+CoreDataProperties.h"
