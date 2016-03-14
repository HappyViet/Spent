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
