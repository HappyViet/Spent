//
//  SPCategory.m
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPCategory.h"
#import "SPTransaction.h"

@implementation SPCategory

// Insert code here to add functionality to your managed object subclass

+ (void)checkAndCreateBasicEntities{
    NSArray *categories = [SPCategory MR_findAll];
    
    if(!(categories.count >0)){
	   SPCategory *newCategory = [SPCategory MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
	   
	   [newCategory setId:[NSNumber numberWithInt:1]];
	   [newCategory setName:@"Food"];
	   [newCategory setColor:@"#FF0000"];
	   [newCategory setTotal:[NSNumber numberWithDouble:0]];
	   
	   [newCategory setId:[NSNumber numberWithInt:2]];
	   [newCategory setName:@"Entertainment"];
	   [newCategory setColor:@"#0000FF"];
	   [newCategory setTotal:[NSNumber numberWithDouble:0]];
	   
	   [newCategory setId:[NSNumber numberWithInt:3]];
	   [newCategory setName:@"Essentials"];
	   [newCategory setColor:@"#00FF00"];
	   [newCategory setTotal:[NSNumber numberWithDouble:0]];
	   
	   [newCategory setId:[NSNumber numberWithInt:4]];
	   [newCategory setName:@"Other"];
	   [newCategory setColor:@"#FFFF00"];
	   [newCategory setTotal:[NSNumber numberWithDouble:0]];
	   
	   [[NSManagedObjectContext MR_defaultContext]MR_saveToPersistentStoreAndWait];
    }
}

+ (double)returnTotal{
    NSArray *categories = [SPCategory MR_findAll];
    double total = 0;
    for ( SPCategory *cat in categories){
	   total += [[cat total]doubleValue];
    }
    
    return total;
}

@end
