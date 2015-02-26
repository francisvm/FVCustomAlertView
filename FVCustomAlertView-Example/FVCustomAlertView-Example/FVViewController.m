//
//  FVViewController.m
//  FVCustomAlertView
//
//  Created by Francis Visoiu Mistrih on 13/07/2014.
//  Copyright (c) 2014 Francis Visoiu Mistrih. All rights reserved.
//

#import "FVViewController.h"
#import "FVCustomAlertView.h"

@interface FVViewController ()

@end

@implementation FVViewController

- (IBAction)loadingButtonPressed:(id)sender {
    [FVCustomAlertView showDefaultLoadingAlertOnView:self.view withTitle:@"Loading..." withBlur:YES allowTap:YES];
}

- (IBAction)doneButtonPressed:(id)sender {
    [FVCustomAlertView showDefaultDoneAlertOnView:self.view withTitle:@"Done" withBlur:YES allowTap:YES];
}

- (IBAction)errorButtonPressed:(id)sender {
    [FVCustomAlertView showDefaultErrorAlertOnView:self.view withTitle:@"Error" withBlur:YES allowTap:YES];
}

- (IBAction)warningButtonPressed:(id)sender {
    [FVCustomAlertView showDefaultWarningAlertOnView:self.view withTitle:@"Be careful" withBlur:YES allowTap:YES];
}

- (IBAction)customButtonPressed:(id)sender {
    UISwitch *sw = [[UISwitch alloc] init];
    sw.on = YES;
    [FVCustomAlertView showAlertOnView:self.view withTitle:@"Do you want to recieve notifications from us?" titleColor:[UIColor whiteColor] width:120 height:140 blur:YES backgroundImage:nil backgroundColor:[UIColor blackColor] cornerRadius:20 shadowAlpha:0.2 alpha:0.8 contentView:sw type:FVAlertTypeCustom allowTap:YES];
}

- (IBAction)bgCustomButtonPressed:(id)sender {
    UISegmentedControl *control = [[UISegmentedControl alloc] initWithItems:@[@"Default", @"Custom"]];
    [control setSelectedSegmentIndex:0];
    [control setTintColor:[UIColor whiteColor]];

    UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [closeButton setTintColor:[UIColor whiteColor]];
    [closeButton setTitle:@"Done" forState:UIControlStateNormal];
    [closeButton sizeToFit];
    [closeButton addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];

    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(0, 5, 120, 120);
    [contentView addSubview:control];
    [contentView addSubview:closeButton];

    closeButton.frame = CGRectMake(contentView.frame.origin.x
                                   + contentView.frame.size.width/2 - closeButton.frame.size.width/2, control.frame.origin.y
                                   + control.frame.size.height + 5, closeButton.frame.size.width, closeButton.frame.size.height);


    [FVCustomAlertView showAlertOnView:self.view withTitle:@"Choose!" titleColor:[UIColor whiteColor] width:150 height:110 blur:YES backgroundImage:[UIImage imageNamed:@"bg"] backgroundColor:nil cornerRadius:10.0 shadowAlpha:0.4 alpha:0.9 contentView:contentView type:FVAlertTypeCustom allowTap:YES];
}

- (void)close:(id)sender {
    [FVCustomAlertView hideAlertFromView:self.view fading:YES];
}

@end
