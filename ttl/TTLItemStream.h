//
//  TTLItemCollection.h
//  ttl
//
//  Created by Tom Livesey on 11/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTLItem.h"

@interface TTLItemStream : NSObject

@property(nonatomic, strong) NSMutableArray *items;

-(void)retrieveItemsFromAPI:(void (^) (NSMutableArray *items))successHandler;
-(void)addItem:(TTLItem *)item;
-(void)getItem:(void (^) (TTLItem *item))handler;
-(void)removeCurrentItems;
-(void)handleUserSettingsChange;
@end