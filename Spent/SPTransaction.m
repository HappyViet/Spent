//
//  SPTransaction.m
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPTransaction.h"

@implementation SPTransaction

+ (instancetype)buildTransactionFromDictionary:(NSDictionary *)dict{
    SPTransaction *newTransaction = [SPTransaction MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
    [newTransaction setName:[dict valueForKey:@"name"]];
    [newTransaction setAmountSpent:[dict valueForKey:@"amountSpent"]];
    [newTransaction setDateSpent:[dict valueForKey:@"dateSpent"]];
    SPCategory *cat = [SPCategory MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"id == %@", [dict valueForKey:@"category"]]];
    if(cat){
	   [newTransaction setCategory:cat];
	   float newTotal = [[newTransaction amountSpent] floatValue] + [[cat total] floatValue];
	   [cat setTotal:[NSNumber numberWithFloat:newTotal]];
    }
    [newTransaction setComment:[dict valueForKey:@"comment"]];
    
    [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    
    return newTransaction;
}

@end
