//
//  TTLUserPreferences.m
//  ttl
//
//  Created by Tom Livesey on 13/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import "TTLUserSettings.h"

@implementation TTLUserSettings

+ (TTLUserSettings *)sharedInstance
{
    static TTLUserSettings *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TTLUserSettings alloc] init];
    });
    return sharedInstance;
}

-(void)setUserGender:(NSInteger)gender
{
    [[self settings] setInteger:gender forKey:@"userGender"];
    [self publishSettingsChangeNotification];
}

-(NSInteger)userGender
{
    return [[self settings]integerForKey:@"userGender"];
}

-(void)setItemGender:(NSInteger)gender
{
    [[self settings] setInteger:gender forKey:@"itemGender"];
    [self publishSettingsChangeNotification];

}

-(NSInteger)itemGender
{
    return [[self settings] integerForKey:@"itemGender"];
}

-(NSString *)userGenderString
{
    if (self.userGender == 0){
        return @"male";
    } else {
        return @"female";
    }
}

-(NSString *)itemGenderString
{
    if (self.itemGender == 0){
        return @"womens";
    } else if (self.itemGender == 1){
        return @"mens";
    } else {
        return @"both";
    }
}

-(NSUserDefaults *)settings
{
    return [NSUserDefaults standardUserDefaults];
}

-(void)publishSettingsChangeNotification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"userSettingsChanged" object: self];
}

@end
