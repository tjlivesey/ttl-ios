//
//  TTLItem.m
//  ttl
//
//  Created by Tom Livesey on 04/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import "TTLItem.h"
#import "AFNetworking.h"

@interface TTLItem ()
@end

@implementation TTLItem

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _referenceId = dictionary[@"id"];
        _description = dictionary[@"description"];
        _images = dictionary[@"image"];
        _link =  dictionary[@"link"];
        _price = dictionary[@"price"];
    }
    return self;
}

-(void)like
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"http://22lines.dev/api/v1/items/%@/like.json", self.referenceId];
    [manager POST:url
      parameters:Nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {}
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }
     ];
}

-(void)dislike
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url = [NSString stringWithFormat:@"http://22lines.dev/api/v1/items/%@/dislike.json", self.referenceId];    [manager POST:url
       parameters:Nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {}
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
          }
     ];
}

@end
