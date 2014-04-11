//
//  TTLViewController.h
//  ttl
//
//  Created by Tom Livesey on 04/02/2014.
//  Copyright (c) 2014 22lines. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTLItemStream.h"

@interface TTLViewController : UIViewController
@property (nonatomic, strong) TTLItemStream *itemStream;
@property (nonatomic, strong) TTLItem *currentItem;
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

-(void)getNextItem;
-(void)displayItem:(TTLItem *)item;
- (IBAction)likeItem:(id)sender;
- (IBAction)dislikeItem:(id)sender;
@end
