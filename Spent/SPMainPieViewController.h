//
//  SPMainPieViewController.h
//  Spent
//
//  Created by Scott Ha on 3/15/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterTransitionDelegate;

@interface SPMainPieViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) id <MasterTransitionDelegate> masterTransitionDelegate;
- (void) updateDisplay;
@end