//
//  GCPost.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCUser.h"
#import "GCGame.h"

@interface GCPost : NSObject{
    GCUser *gUser;
    GCGame *gGame;
    NSString *postMessage;
    NSDate *postDate;
}
@property NSString * postMessage;
@property GCUser *gUser;
@property GCGame *gGame;
@property NSDate *postDate;

-(void)setPostMessage:(NSString*)aMessage;
-(NSString*)postMessage;
-(void)setPostDate:(NSDate *)aPostDate;
-(NSDate *)postDate;
-(NSString *)description;

@end
