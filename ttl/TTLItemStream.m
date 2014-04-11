//
//  TTLItemCollection.m
//  ttl
//
//  Created by Tom Livesey on 11/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import "TTLITem.h"
#import "TTLItemStream.h"
#import "AFNetworking.h"
#import "TTLUserSettings.h"

@implementation TTLItemStream

- (id)init {
    self = [super init];
    if (self) {
        // Register user settings change observer.
        [[NSNotificationCenter defaultCenter]
         addObserver:self
            selector:@selector(handleUserSettingsChange)                                                 name:@"userSettingsChanged"
              object:nil
         ];
    }
    return self;
}

-(void)retrieveItemsFromAPI:(void (^) (NSMutableArray *items))successHandler
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *itemGender = [[TTLUserSettings sharedInstance] itemGenderString];
    
    NSLog(@"Item gender %@", itemGender);
    
    [manager GET:@"http://22lines.dev/api/v1/items.json"
      parameters:@{@"gender" : itemGender}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             for (NSDictionary *itemDictionary in responseObject) {
                 [items addObject:[[TTLItem alloc ] initWithDictionary:itemDictionary]];
             }
             successHandler(items);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
}

-(void)addItem:(TTLItem *)item
{
    if (!self.items) self.items = [[NSMutableArray alloc] init];
    [self.items addObject:item];
}

-(void)getItem:(void (^) (TTLItem *item))handler
{
    if ([self.items count] == 0) {
        [self retrieveItemsFromAPI:^(NSMutableArray *items) {
            for (TTLItem *item in items) {
                [self addItem:item];
            }
            TTLItem *item = [self.items firstObject];
            [self.items removeObject:item];
            handler(item);
        }];
    } else {
        TTLItem *item = [self.items firstObject];
        [self.items removeObject:item];
        handler(item);
    }
}

-(void)handleUserSettingsChange
{
    [self removeCurrentItems];
}

-(void)removeCurrentItems
{
    NSLog(@"Removing current items in item stream");
    [self.items removeAllObjects];
}

@end
