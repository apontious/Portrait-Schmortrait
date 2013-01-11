//
//  ViewController.m
//  Portrait Schmortrait http://github.com/apontious/Portrait-Schmortrait
//
//  Created by Andrew Pontious on 1/10/13.
//  Copyright (c) 2013 Andrew Pontious.
//  Some right reserved: http://opensource.org/licenses/mit-license.php
//

#import "ViewController.h"

#import "LoginViewController.h"

@interface ViewController ()

@property (strong) LoginViewController *loginViewController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)simulateSessionTimeout {
    if (self.loginViewController == nil) {
        self.loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        self.loginViewController.myViewController = self;
    }
    
    self.loginViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.loginViewController.view];
    
    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation]) == YES) {
        if ([[[UIDevice currentDevice] systemVersion] compare:@"6" options:NSNumericSearch] != NSOrderedAscending) {
            // iOS 6
            
            // DELETE -- Doesn't work. Replace with ?
			  // This is a terrible, terrible hack, but I can't find another technique to force the orientation to change on iOS 6. I apologize to any future developers that have to deal with the headaches that this causes.
			  UIViewController *vc = [[UIViewController alloc] init];

			  [self presentViewController:vc animated:NO completion:^{

				  [self dismissViewControllerAnimated:NO completion:^{


				  }];
				  
			  }];
			  
        } else {
            // iOS 5

            // From http://stackoverflow.com/questions/11366929/force-rotate-view-controller
            UIWindow *window = [[UIApplication sharedApplication] keyWindow];
            UIView *view = window.subviews[0];
            [view removeFromSuperview];
            [window addSubview:view];
        }
    }
}

- (void)login {
    [self.loginViewController.view removeFromSuperview];
}

#pragma mark - iOS 5 Rotation Methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    if ([self.view.subviews containsObject:self.loginViewController.view] == YES) {
        return [self.loginViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
    }
    
    return YES;
}

#pragma mark - iOS 6 Rotation Methods

- (BOOL)shouldAutorotate {
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations {
    if ([self.view.subviews containsObject:self.loginViewController.view] == YES) {
        return [self.loginViewController supportedInterfaceOrientations];
    }
    
    return UIInterfaceOrientationMaskAll;
}

@end
