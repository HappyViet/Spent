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

@interface SPMasterViewController ()
@property (nonatomic, strong) SPMainViewController *mainVC;
@property (nonatomic, strong) SPAddViewController *addVC;

@end

@implementation SPMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [SPCategory checkAndCreateBasicEntities];
    
    self.mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
    self.mainVC.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    [self addChildViewController:self.mainVC];
    [self.view addSubview:self.mainVC.view];
    [self.titleLabel setText:@"Main View"];
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
	   
	   [self animateMainViewOut];
	   [self animateView:self.addVC.view toRect:self.mainVC.view.frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
		  [self.menuButton setHidden:YES];
		  [self.backButton setHidden:NO];
		  [self.addButton setHidden:YES];
		  [self.titleLabel setText:@"Add Transaction"];
    }];
    }
    
}

- (IBAction)didClickBackButton:(id)sender {
    [self animateMainViewIn];
    UIView *view = self.addVC.view;
    CGRect frame = CGRectMake(view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    [self animateView:view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
	   [self.addVC removeFromParentViewController];
	   [self.addVC.view removeFromSuperview];
	   self.addVC = nil;
    }];
}

#pragma mark -
#pragma mark - Animations

- (void)animateMainViewOut {
    UIView *view = self.mainVC.view;
    CGRect frame = CGRectMake(-1*view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    [self animateView:view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
	   
    }];
}

- (void)animateMainViewIn {
    CGRect frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    [self animateView:self.mainVC.view toRect:frame withDelay:0 withCompletion:^(POPAnimation *animation, BOOL finished) {
	   [self.titleLabel setText:@"Main View"];
	   [self.menuButton setHidden:NO];
	   [self.addButton setHidden:NO];
	   [self.backButton setHidden:YES];
	   [self.mainVC updateDisplay];
    }];
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
