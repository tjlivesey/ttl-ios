//
//  TTLUserPreferences.h
//  ttl
//
//  Created by Tom Livesey on 13/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTLUserSettings : NSObject

@property(nonatomic, assign) NSInteger userGender;
@property(nonatomic, assign) NSInteger itemGender;
@property(nonatomic, assign) NSInteger minPrice;
@property(nonatomic, assign) NSInteger maxPrice;

+ (TTLUserSettings *)sharedInstance;

-(NSString *)userGenderString;
-(NSString *)itemGenderString;
-(NSUserDefaults *)settings;
-(void)publishSettingsChangeNotification;

@end
