//
//  SPAddViewController.m
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPAddViewController.h"
#import "SPBasicTableViewCell.h"
#import "SPAmountViewCell.h"
#import "SPDateViewCell.h"
#import "SPCategoryTableViewCell.h"
#import "SPCommentTableViewCell.h"
#import "SPAddTableViewCell.h"

@interface SPAddViewController (){
}

@end

@implementation SPAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createEntity:(id)sender {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    if (self.name.length >0 && self.amount.floatValue >0){
	   [dict setObject:self.name forKey:@"name"];
	   [dict setObject:self.amount forKey:@"amountSpent"];
	   [dict setObject:self.date forKey:@"dateSpent"];
	   [dict setObject:@4 forKey:@"category"];
	   if(self.comment){
		  [dict setObject:self.comment forKey:@"comment"];
	   }else{
		[dict setObject:@"" forKey:@"comment"];  
	   }
    
	   [SPTransaction buildTransactionFromDictionary:dict];
	   [self.masterTransitionDelegate transitionToMaster:self];
    }
}

#pragma mark -
#pragma mark - TableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0){
	   SPBasicTableViewCell *cell = (SPBasicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"basicCell" forIndexPath:indexPath];
	   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	   cell.nameTextField.delegate = self;

	   return cell;
    }else if (indexPath.row == 1){
	   SPAmountViewCell *cell = (SPAmountViewCell *)[tableView dequeueReusableCellWithIdentifier:@"amountCell" forIndexPath:indexPath];
	   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	   cell.amountTextField.delegate = self;

	   return cell;
    }else if (indexPath.row == 2){
	   SPDateViewCell *cell = (SPDateViewCell *)[tableView dequeueReusableCellWithIdentifier:@"dateCell" forIndexPath:indexPath];
	   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	   cell.dateTextField.delegate = self;

	   return cell;
    }else if (indexPath.row == 3){
	   SPCategoryTableViewCell *cell = (SPCategoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"categoryCell" forIndexPath:indexPath];
	   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	   cell.categoryTextField.delegate = self;

	   return cell;
    }else if (indexPath.row == 4){
	   SPCommentTableViewCell *cell = (SPCommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
	   [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
	   //cell.commentTextField.delegate = self;
	   
	   return cell;
    }
    SPAddTableViewCell *cell = (SPAddTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"addCell" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 4){
	   return 60;
    }
    return 120;
}

#pragma mark -
#pragma mark - Text Field Delegate

- (IBAction)fieldEntryDidChange:(id)sender {
    UITextField *currentField = (UITextField *)sender;
    self.name = currentField.text;
}

- (IBAction)amountEntryDidChange:(id)sender {
    UITextField *currentField = (UITextField *)sender;
    self.amount = [NSNumber numberWithDouble:[currentField.text doubleValue]];
}

- (IBAction)dateEntryDidChange:(id)sender {
    //UITextField *currentField = (UITextField *)sender;
    self.date = [NSDate date];
}

- (IBAction)categoryDidChange:(id)sender {
    //UITextField *currentField = (UITextField *)sender;
    //self.c = currentField.text;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
