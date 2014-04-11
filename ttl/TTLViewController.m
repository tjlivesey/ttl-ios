//
//  TTLViewController.m
//  ttl
//
//  Created by Tom Livesey on 04/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import "TTLItem.h"
#import "TTLViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface TTLViewController ()
@end

@implementation TTLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.itemStream = [[TTLItemStream alloc] init];
    self.currentImage.contentMode = UIViewContentModeScaleAspectFit;
    [self getNextItem];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"userSettingsChanged"
                    object:nil
                     queue:[NSOperationQueue mainQueue]
                usingBlock:^(NSNotification *n){
                    NSLog(@"Removing current item after settings change");
                   [self getNextItem];
               }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getNextItem
{
    [self.itemStream getItem:^(TTLItem *item) {
        if (item){
            [self setCurrentItem:item];
        } else {
            NSLog(@"No items from API");
        }
    }];
}

-(void) setCurrentItem:(TTLItem *)item
{
    _currentItem = item;
    [self displayItem:item];
}

- (void) displayItem:(TTLItem *)item
{
    [self.currentImage setImageWithURL:[NSURL URLWithString: [item.images objectForKey:@"large"]]];
}
     
- (IBAction)likeItem:(id)sender
{
    [self.currentItem like];
    [self getNextItem];
}

- (IBAction)dislikeItem:(id)sender
{
    [self.currentItem dislike];
    [self getNextItem];
}

@end