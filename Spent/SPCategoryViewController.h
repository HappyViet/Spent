//
//  SPCategoryViewController.h
//  Spent
//
//  Created by Scott Ha on 3/14/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPCategoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) id <MasterTransitionDelegate> masterTransitionDelegate;

@end
