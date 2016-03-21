//
//  SPMasterViewController.m
//  Spent
//
//  Created by Scott Ha on 3/13/16.
//  Copyright © 2016 HappyViet. All rights reserved.
//

#import "SPMasterViewController.h"
#import "SPMainViewController.h"
#import "SPAddViewController.h"
#import "SPMainPieViewController.h"
#import "SPSettingsViewController.h"
#import "SPCategoryViewController.h"

@interface SPMasterViewController (){
    BOOL barDisplay;
}
@property (nonatomic, strong) SPMainViewController *mainVC;
@property (nonatomic, strong) SPMainPieViewController *pieVC;
@property (nonatomic, strong) SPAddViewController *addVC;
@property (nonatomic, strong) SPSettingsViewController *settingsVC;
@property (nonatomic, strong) SPCategoryViewController	*categoryVC;
@end

@implementation SPMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Check if we have our basic Categories on launch
    [SPCategory checkAndCreateBasicEntities];
    barDisplay = [[NSUserDefaults standardUserDefaults] boolForKey:@"barDisplay"];
    
    // Testing out display settings. YES for bars, NO for pie chart
    
    if(barDisplay){
	   self.mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
	   self.mainVC.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
	   [self addChildViewController:self.mainVC];
	   [self.view addSubview:self.mainVC.view];
	   [self.titleLabel setText:@"Main View"];
    }else{
	   self.pieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"pieVC"];
	   self.pieVC.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
	   [self addChildViewController:self.pieVC];
	   [self.view addSubview:self.pieVC.view];
	   [self.titleLabel setText:@"Main View"];
    }
	
	NSLog(@"\nTesting date grabber.\nDays back: %d\nTotal: %f", 5, [SPCategory returnCategoryTotalDate:3 daysBack:5]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickAddButton:(id)sender {
    if (!self.addVC){
	   self.addVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addVC"];
	   self.addVC.view.frame = CGRectMake(self.view.frame.size.width, 50, self.view.frame.size.width, self.view.frame.size.height-50);
	   self.addVC.masterTransitionDelegate = self;
	   [self addChildViewController:self.addVC];
	   [self.view addSubview:self.addVC.view];
	   [self animateViewOut];
	   
	   if(barDisplay){
		  [self animateView:self.addVC.view toRect:self.mainVC.view.frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {}];
		  
	   }else{
		  [self animateView:self.addVC.view toRect:self.pieVC.view.frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {}];
	   }
	   
	   [self.menuButton setHidden:YES];
	   [self.backButton setHidden:NO];
	   [self.addButton setHidden:YES];
	   [self.titleLabel setText:@"Add Transaction"];
    }
    
}

- (IBAction)didClickSettingsButton:(id)sender {
    if (!self.settingsVC){
	   self.settingsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"settingsVC"];
	   self.settingsVC.view.frame = CGRectMake(self.view.frame.size.width, 50, self.view.frame.size.width, self.view.frame.size.height-50);
	   self.settingsVC.masterTransitionDelegate = self;
	   [self addChildViewController:self.settingsVC];
	   [self.view addSubview:self.settingsVC.view];
	   [self animateViewOut];
	   
	   if(barDisplay){
		  [self animateView:self.settingsVC.view toRect:self.mainVC.view.frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {}];
		  
	   }else{
		  [self animateView:self.settingsVC.view toRect:self.pieVC.view.frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {}];
	   }
	   
	   [self.menuButton setHidden:YES];
	   [self.backButton setHidden:NO];
	   [self.addButton setHidden:YES];
	   [self.titleLabel setText:@"Settings"];
    }
}


- (IBAction)didClickBackButton:(id)sender {
    [self animateViewIn];
    if(self.addVC.view){
	    UIView *view = self.addVC.view;
	    CGRect frame = CGRectMake(view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
	    [self animateView:view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
		  [self.addVC removeFromParentViewController];
		  [self.addVC.view removeFromSuperview];
		  self.addVC = nil;
	   }];
    }
    else if(self.settingsVC.view){
	   if (barDisplay == [[NSUserDefaults standardUserDefaults] boolForKey:@"barDisplay"]){
		  UIView *view = self.settingsVC.view;
		  CGRect frame = CGRectMake(view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
		  [self animateView:view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
			 [self.settingsVC removeFromParentViewController];
			 [self.settingsVC.view removeFromSuperview];
			 self.settingsVC = nil;
		  }];
	   }else{
		  barDisplay = [[NSUserDefaults standardUserDefaults] boolForKey:@"barDisplay"];
		  [self.settingsVC removeFromParentViewController];
		  [self.settingsVC.view removeFromSuperview];
		  self.settingsVC = nil;

		  if(barDisplay){
			 [self.pieVC removeFromParentViewController];
			 [self.pieVC.view removeFromSuperview];
			 self.pieVC = nil;
			 self.mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
			 self.mainVC.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
			 [self addChildViewController:self.mainVC];
			 [self.view addSubview:self.mainVC.view];
			 [self.titleLabel setText:@"Main View"];
		  }else{
			 [self.mainVC removeFromParentViewController];
			 [self.mainVC.view removeFromSuperview];
			 self.mainVC = nil;
			 self.pieVC = [self.storyboard instantiateViewControllerWithIdentifier:@"pieVC"];
			 self.pieVC.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
			 [self addChildViewController:self.pieVC];
			 [self.view addSubview:self.pieVC.view];
			 [self.titleLabel setText:@"Main View"];
		  }
	   }
    }
	else if(self.categoryVC.view){
		UIView *view = self.categoryVC.view;
		CGRect frame = CGRectMake(view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
		[self animateView:view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
			[self.categoryVC removeFromParentViewController];
			[self.categoryVC.view removeFromSuperview];
			self.categoryVC = nil;
		}];
	}
}

#pragma mark -
#pragma mark - Animations

- (void)animateViewOut {
    UIView *view;
    
    if(barDisplay){
	   view = self.mainVC.view;
    }else{
	   view = self.pieVC.view;
    }
    
    CGRect frame = CGRectMake(-1*view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    [self animateView:view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished){}];
}

- (void)animateViewIn {
    CGRect frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    
    if(barDisplay){
	   [self animateView:self.mainVC.view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
		  [self.mainVC updateDisplay];}];
    }else{
	   [self animateView:self.pieVC.view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
		  [self.pieVC updateDisplay];}];
    }
    
    [self.titleLabel setText:@"Main View"];
    [self.menuButton setHidden:NO];
    [self.addButton setHidden:NO];
    [self.backButton setHidden:YES];
}

- (void)animateView:(UIView *)view toRect:(CGRect)frame withDelay:(CGFloat)delay withCompletion:(void(^)(POPAnimation *animation, BOOL finished))completion {
    POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.beginTime = CACurrentMediaTime();
    animation.fromValue = [NSValue valueWithCGRect:view.frame];
    animation.toValue = [NSValue valueWithCGRect:frame];
    animation.completionBlock = completion;
    [view pop_addAnimation:animation forKey:@"Animate_View_Frame"];
}

#pragma mark -
#pragma mark - Delegation

-(void)transitionToMaster:(UIViewController *)controller{
    if(controller == self.addVC){
	   [self didClickBackButton:nil];
    }
    else if(controller == self.settingsVC){
	    [self didClickBackButton:self.settingsVC.view];
    }
    else if(controller == self.pieVC){
	    NSLog(@"What the fuck");
    }
}

-(void)transitionToCategory:(UIViewController *)controller indexNum:(int)index categoryName:(NSString *)nameCategory{
	NSLog(@"Inside transition to category");
	if(controller == self.mainVC || controller == self.pieVC){
		if (!self.categoryVC){
			self.categoryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"categoryVC"];
			self.categoryVC.view.frame = CGRectMake(self.view.frame.size.width, 50, self.view.frame.size.width, self.view.frame.size.height-50);
			self.categoryVC.masterTransitionDelegate = self;
			[self addChildViewController:self.categoryVC];
			[self.view addSubview:self.categoryVC.view];
			[self animateViewOut];
			
			[self animateView:self.categoryVC.view toRect:self.mainVC.view.frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {}];
			
			[self.menuButton setHidden:YES];
			[self.backButton setHidden:NO];
			[self.addButton setHidden:YES];
			[self.titleLabel setText:nameCategory];
		}
	}
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
