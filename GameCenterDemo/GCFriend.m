//
//  GCFriend.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/24/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "GCFriend.h"

@implementation GCFriend
@synthesize isMyFriend = _isMyFriend;
@synthesize userID = _userID;

-(void)setIsMyFriend:(BOOL)aIsMyFriend{
    _isMyFriend = aIsMyFriend;
}

-(BOOL)isMyFriend{
    return _isMyFriend;
}

-(void)setUserID:(NSString *)aUserID{
    _userID = aUserID;
}
-(NSString *)userID{
    return _userID;
}

@end
