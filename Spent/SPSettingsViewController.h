//
//  SPSettingsViewController.h
//  Spent
//
//  Created by Scott Ha on 3/15/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterTransitionDelegate;

@interface SPSettingsViewController : UIViewController
@property (weak, nonatomic) id <MasterTransitionDelegate> masterTransitionDelegate;

@end
