//
//  TTLSettingsViewController.m
//  ttl
//
//  Created by Tom Livesey on 10/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import "TTLSettingsViewController.h"

@interface TTLSettingsViewController ()

@end

@implementation TTLSettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayCurrentPreferences];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)displayCurrentPreferences
{
    // Set user gender
    NSInteger userGender = [[TTLUserSettings sharedInstance] userGender];
    [self.userGender setSelectedSegmentIndex:userGender];
    // Set item gender
    NSInteger itemGender = [[TTLUserSettings sharedInstance] itemGender];
    [self.itemGender setSelectedSegmentIndex:itemGender];
}

- (IBAction)itemGenderSelected:(id)sender {
    [[TTLUserSettings sharedInstance] setItemGender:[self.itemGender selectedSegmentIndex]];
}

- (IBAction)userGenderSelected:(id)sender {
    [[TTLUserSettings sharedInstance] setUserGender:[self.userGender selectedSegmentIndex]];
}

@end
    
