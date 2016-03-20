//
//  SPCategoryTableViewCell.h
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPCategoryTableViewCell;
@protocol CategoryCellDelegate <NSObject>
- (void)didClickChangeCategory:(SPCategoryTableViewCell *)sender;
@end

@interface SPCategoryTableViewCell : UITableViewCell
@property (weak, nonatomic) id<CategoryCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *selectedCategory;
@property (weak, nonatomic) IBOutlet UIButton *dropDownButton;

@end
