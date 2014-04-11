//
//  TTLSettingsViewController.h
//  ttl
//
//  Created by Tom Livesey on 10/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTLUserSettings.h"
#import "NMRangeSlider.h"

@interface TTLSettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *userGender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *itemGender;
@property (weak, nonatomic) IBOutlet NMRangeSlider *priceRange;

-(IBAction)userGenderSelected:(id)sender;
- (IBAction)itemGenderSelected:(id)sender;
-(void)displayCurrentPreferences;


@end
