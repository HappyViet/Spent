//
//  SPMainViewController.m
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPMainViewController.h"

@interface SPMainViewController (){
}
@property (weak, nonatomic) IBOutlet UILabel *amountDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *category01_title;
@property (weak, nonatomic) IBOutlet UILabel *category02_title;
@property (weak, nonatomic) IBOutlet UILabel *category03_title;
@property (weak, nonatomic) IBOutlet UILabel *category04_title;
@property (weak, nonatomic) IBOutlet UILabel *category01_amount;
@property (weak, nonatomic) IBOutlet UILabel *category02_amount;
@property (weak, nonatomic) IBOutlet UILabel *category03_amount;
@property (weak, nonatomic) IBOutlet UILabel *category04_amount;

@end

@implementation SPMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateDisplay];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateDisplay{
    self.amountDisplayLabel.text = [NSString stringWithFormat:@"$%.2f", [SPCategory returnTotal]];
    
    // MUST FIX COLORIZING CATEGORIES (ADD HEX TO UICOLOR COMPATIBILITY)
    // Coloring has to be implemented for the categories
    
    self.category01_title.text = [SPCategory returnCategoryName:0];
    //self.category01_title.textColor = [SPCategory returnCategoryColor:0];
    self.category01_amount.text = [NSString stringWithFormat:@"$%.2f", [SPCategory returnCategoryTotal:0]];
    
    self.category02_title.text = [SPCategory returnCategoryName:1];
    //self.category01_title.textColor = [SPCategory returnCategoryColor:1;
    self.category02_amount.text = [NSString stringWithFormat:@"$%.2f", [SPCategory returnCategoryTotal:1]];
    
    self.category03_title.text = [SPCategory returnCategoryName:2];
    //self.category01_title.textColor = [SPCategory returnCategoryColor:2];
    self.category03_amount.text = [NSString stringWithFormat:@"$%.2f", [SPCategory returnCategoryTotal:2]];
    
    self.category04_title.text = [SPCategory returnCategoryName:3];
    //self.category01_title.textColor = [SPCategory returnCategoryColor:3];
    self.category04_amount.text = [NSString stringWithFormat:@"$%.2f", [SPCategory returnCategoryTotal:3]];
    
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
