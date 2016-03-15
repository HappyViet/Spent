//
//  SPCategoryTableViewCell.m
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPCategoryTableViewCell.h"
#import "POP.h"

@implementation SPCategoryTableViewCell {
    NSMutableArray *categoryArray;
}

- (void)awakeFromNib {
    // Initialization code
    categoryArray = [NSMutableArray new];
    categoryArray = [[SPCategory MR_findAll] mutableCopy];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didClickDropDownButton:(id)sender {
    UIViewController *viewController = [[UIViewController alloc] init];
    float tableHeight = [categoryArray count]*30;
    UIView *viewForCategory = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, tableHeight)];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 40, tableHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.hidden = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    [viewForCategory addSubview:self.tableView];
    [viewController.view addSubview:viewForCategory];
    
    [viewController setModalPresentationStyle:UIModalPresentationPopover];
    
}


#pragma mark - Tableview delegate 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [[categoryArray objectAtIndex:indexPath.row] name];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [categoryArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCategory.text = [[categoryArray objectAtIndex:indexPath.row] name];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}


@end
