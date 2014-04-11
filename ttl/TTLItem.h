//
//  TTLItem.h
//  ttl
//
//  Created by Tom Livesey on 04/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTLItem : NSObject

@property(nonatomic, strong) NSString *referenceId;
@property(nonatomic, strong) NSString *description;
@property(nonatomic, strong) NSString *link;
@property(nonatomic, strong) NSNumber *price;
@property(nonatomic, strong) NSDictionary *images;

-(id)initWithDictionary:(NSDictionary *)dictionary;
-(void)like;
-(void)dislike;
@end
