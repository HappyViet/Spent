//
//  SPCategoryViewController.m
//  Spent
//
//  Created by Scott Ha on 3/14/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPCategoryViewController.h"
#import "SPTransactionTableViewCell.h"

@interface SPCategoryViewController (){
	NSString *categoryName;
}
@property (nonatomic, strong) NSArray *transactions;
@end

@implementation SPCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	categoryName = @"Other";
	self.transactions = [SPTransaction MR_findAllSortedBy:categoryName ascending:NO];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - TableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SPTransactionTableViewCell *cell = (SPTransactionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"transactionCell" forIndexPath:indexPath];
	cell.transactionNameLabel.text = [[self.transactions objectAtIndex:(int)indexPath] name];
	cell.amountLabel.text = [[[self.transactions objectAtIndex:(int)indexPath] amountSpent] stringValue];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
