//
//  SPMasterViewController.h
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterTransitionDelegate <NSObject>

-(void)transitionToMaster:(UIViewController *)controller;
@end

@interface SPMasterViewController : UIViewController <MasterTransitionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end
