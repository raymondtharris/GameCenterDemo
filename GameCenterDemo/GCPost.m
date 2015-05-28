//
//  GCPost.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "GCPost.h"

@implementation GCPost
@synthesize postMessage =_postMessage;
@synthesize gGame=_gGame, gUser=_gUser;
@synthesize postDate = _postDate;

-(void)setPostMessage:(NSString *)aMessage{
    _postMessage = aMessage;
}
-(NSString *)postMessage{
    return _postMessage;
}

-(void)setPostDate:(NSDate *)aPostDate{
    _postDate = aPostDate;
}
-(NSDate *)postDate{
    return _postDate;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Game\n%@ \nUser\n%@postMessage:%@ \n\n",[self.gGame description], [self.gUser description],[self postMessage]];
}
@end
