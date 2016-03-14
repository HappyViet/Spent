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
    
    if(!(categories.count >3)){
	   SPCategory *newCategory1 = [SPCategory MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
	   [newCategory1 setId:[NSNumber numberWithInt:1]];
	   [newCategory1 setName:@"Food"];
	   [newCategory1 setColor:@"#FF0000"];
	   [newCategory1 setTotal:[NSNumber numberWithDouble:0]];
	   
	   SPCategory *newCategory2 = [SPCategory MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
	   [newCategory2 setId:[NSNumber numberWithInt:2]];
	   [newCategory2 setName:@"Entertainment"];
	   [newCategory2 setColor:@"#0000FF"];
	   [newCategory2 setTotal:[NSNumber numberWithDouble:0]];
							 
	   SPCategory *newCategory3 = [SPCategory MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
	   [newCategory3 setId:[NSNumber numberWithInt:3]];
	   [newCategory3 setName:@"Essentials"];
	   [newCategory3 setColor:@"#00FF00"];
	   [newCategory3 setTotal:[NSNumber numberWithDouble:0]];
	   
	   SPCategory *newCategory4 = [SPCategory MR_createEntityInContext:[NSManagedObjectContext MR_defaultContext]];
	   [newCategory4 setId:[NSNumber numberWithInt:4]];
	   [newCategory4 setName:@"Other"];
	   [newCategory4 setColor:@"#FFFF00"];
	   [newCategory4 setTotal:[NSNumber numberWithDouble:0]];
	   
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

+ (double)returnCategoryTotal:(int)category{
    NSArray *categories = [SPCategory MR_findAll];
    SPCategory *cat = categories[category];
    
    return [[cat total]doubleValue];
}

+ (NSString *)returnCategoryName:(int)category{
    NSArray *categories = [SPCategory MR_findAll];
    SPCategory *cat = categories[category];
    
    return [cat name];
}

+ (UIColor *)returnCategoryColor:(int)category{
    NSArray *categories = [SPCategory MR_findAll];
    SPCategory *cat = categories[category];
    
    // Taken from http://stackoverflow.com/questions/1560081/how-can-i-create-a-uicolor-from-a-hex-string
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:[cat color]];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
}

@end
