//
//  GCFriend.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/24/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "GCUser.h"

@interface GCFriend : GCUser{
    BOOL isMyFriend;
    NSString *userID;
}

@property BOOL isMyFriend;
@property NSString * userID;

-(void)setIsMyFriend:(BOOL)aIsMyFriend;
-(BOOL)isMyFriend;
-(void)setUserID:(NSString *)aUserID;
-(NSString *)userID;

@end
