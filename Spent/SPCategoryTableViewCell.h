//
//  SPCategoryTableViewCell.h
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPCategoryTableViewCell : UITableViewCell <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *selectedCategory;
@property (weak, nonatomic) IBOutlet UIButton *dropDownButton;
@property (strong, nonatomic) UITableView *tableView;


@end
