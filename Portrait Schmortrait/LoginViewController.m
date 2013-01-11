//
//  LoginViewController.m
//  Portrait Schmortrait http://github.com/apontious/Portrait-Schmortrait
//
//  Created by Andrew Pontious on 1/10/13.
//  Copyright (c) 2013 Andrew Pontious.
//  Some right reserved: http://opensource.org/licenses/mit-license.php
//

#import "LoginViewController.h"

#import "ViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)login {
    [self.myViewController login];
}

#pragma mark - iOS 5 Rotation Methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark - iOS 6 Rotation Methods

- (BOOL)shouldAutorotate {
    return YES;
}
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
}

@end
