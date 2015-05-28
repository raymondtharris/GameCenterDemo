//
//  GCUser.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCUser : NSObject{
    NSString * Name;
    NSURL * avatarPicURL;
    NSNumber * pointsCount;
    UIImage *avatarImage;
}

@property NSString * Name;
@property NSURL * avatarPicURL;
@property NSNumber * pointsCount;
@property UIImage * avatarImage;

-(void)setGCUserData:(NSDictionary*) userDataDictionary;
-(void)setName:(NSString*)aName;
-(NSString *)Name;
-(void)setAvatarPicURL:(NSURL*) aURL;
-(NSURL*)avatarPicURL;
-(void)setPointsCount:(NSNumber*) aPointCount;
-(NSNumber*)pointsCount;
-(void)setAvatarImage:(UIImage*) anAvatarImage;
-(UIImage*)avatarImage;
-(NSString *)description;
-(UIImage*)avatarImageFromURL:(NSURL*)aURL;
@end
