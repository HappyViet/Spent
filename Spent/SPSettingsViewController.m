//
//  SPSettingsViewController.m
//  Spent
//
//  Created by Scott Ha on 3/15/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPMasterViewController.h"
#import "SPSettingsViewController.h"

@interface SPSettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *barDisplaySwitch;

@end

@implementation SPSettingsViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.barDisplaySwitch setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"barDisplay"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTouchSwitch:(id)sender {
	[[NSUserDefaults standardUserDefaults] setBool:self.barDisplaySwitch.on forKey:@"barDisplay"];
	[self.masterTransitionDelegate transitionToMaster:self];
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
