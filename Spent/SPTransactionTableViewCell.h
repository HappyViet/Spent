//
//  SPTransactionTableViewCell.h
//  Spent
//
//  Created by Scott Ha on 3/14/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPTransactionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *transactionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

@end
