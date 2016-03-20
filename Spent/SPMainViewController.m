//
//  SPMainViewController.m
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPMainViewController.h"

@interface SPMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *amountDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *category01_title;
@property (weak, nonatomic) IBOutlet UILabel *category02_title;
@property (weak, nonatomic) IBOutlet UILabel *category03_title;
@property (weak, nonatomic) IBOutlet UILabel *category04_title;
@property (weak, nonatomic) IBOutlet UILabel *category01_amount;
@property (weak, nonatomic) IBOutlet UILabel *category02_amount;
@property (weak, nonatomic) IBOutlet UILabel *category03_amount;
@property (weak, nonatomic) IBOutlet UILabel *category04_amount;
@property (weak, nonatomic) IBOutlet UIProgressView *category01_bar;
@property (weak, nonatomic) IBOutlet UIProgressView *category02_bar;
@property (weak, nonatomic) IBOutlet UIProgressView *category03_bar;
@property (weak, nonatomic) IBOutlet UIProgressView *category04_bar;
@end

@implementation SPMainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
	[self updateDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Bar View Display

- (void)updateDisplay{
    float total =[SPCategory returnTotal];
    self.amountDisplayLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
    float category01Total = [SPCategory returnCategoryTotal:0];
    self.category01_title.text = [SPCategory returnCategoryName:0];
    self.category01_title.textColor = [SPCategory returnCategoryColor:0];
    self.category01_amount.text = [NSString stringWithFormat:@"$%.2f", category01Total];
    self.category01_amount.textColor = [self.category01_title.textColor colorWithAlphaComponent:.7];
    self.category01_bar.progressTintColor = self.category01_title.textColor;
    self.category01_bar.trackTintColor = [self.category01_amount.textColor colorWithAlphaComponent:.2];
    [self.category01_bar setProgress:category01Total/total animated:YES];
    
    float category02Total = [SPCategory returnCategoryTotal:1];
    self.category02_title.text = [SPCategory returnCategoryName:1];
    self.category02_title.textColor = [SPCategory returnCategoryColor:1];
    self.category02_amount.text = [NSString stringWithFormat:@"$%.2f", category02Total];
    self.category02_amount.textColor = [self.category02_title.textColor colorWithAlphaComponent:.7];
    self.category02_bar.progressTintColor = self.category02_title.textColor;
    self.category02_bar.trackTintColor = [self.category02_amount.textColor colorWithAlphaComponent:.2];
    [self.category02_bar setProgress:category02Total/total animated:YES];
    
    float category03Total = [SPCategory returnCategoryTotal:2];
    self.category03_title.text = [SPCategory returnCategoryName:2];
    self.category03_title.textColor = [SPCategory returnCategoryColor:2];
    self.category03_amount.text = [NSString stringWithFormat:@"$%.2f", category03Total];
    self.category03_amount.textColor = [self.category03_title.textColor colorWithAlphaComponent:.7];
    self.category03_bar.progressTintColor = self.category03_title.textColor;
    self.category03_bar.trackTintColor = [self.category03_amount.textColor colorWithAlphaComponent:.2];
    [self.category03_bar setProgress:category03Total/total animated:YES];
    
    float category04Total = [SPCategory returnCategoryTotal:3];
    self.category04_title.text = [SPCategory returnCategoryName:3];
    self.category04_title.textColor = [SPCategory returnCategoryColor:3];
    self.category04_amount.text = [NSString stringWithFormat:@"$%.2f", category04Total];
    self.category04_amount.textColor = [self.category04_title.textColor colorWithAlphaComponent:.7];
    self.category04_bar.progressTintColor = self.category04_title.textColor;
    self.category04_bar.trackTintColor = [self.category04_amount.textColor colorWithAlphaComponent:.2];
    [self.category04_bar setProgress:category04Total/total animated:YES];
}

#pragma mark -
#pragma mark - UIPickerView Delegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
	return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	return [SPCategory numberOfTotalCategories];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	return [SPCategory returnCategoryName:(int)row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
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
