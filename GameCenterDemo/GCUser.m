//
//  GCUser.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "GCUser.h"

@implementation GCUser

@synthesize Name=_Name, avatarPicURL=_avatarPicURL, avatarImage= _avatarImage, pointsCount=_pointsCount;


-(void)setGCUserData:(NSDictionary*) userDataDictionary{
    [self setName:[userDataDictionary valueForKey:@"Name"]];
    [self setAvatarPicURL:[userDataDictionary valueForKey:@"avatarURL"]];
    [self setPointsCount:[userDataDictionary valueForKey:@"pointsCount"]];
    [self setAvatarImage:[self avatarImageFromURL:[self avatarPicURL]]];
}
-(void)setName:(NSString*)aName{
    _Name = aName;
}
-(NSString *)Name{
    return _Name;
}
-(void)setAvatarPicURL:(NSURL *)aURL{
    _avatarPicURL = aURL;
}
-(NSURL *)avatarPicURL{
    return _avatarPicURL;
}
-(void)setPointsCount:(NSNumber *)aPointCount{
    _pointsCount = aPointCount;
}
-(NSNumber *)pointsCount{
    return _pointsCount;
}
-(void)setAvatarImage:(UIImage *)anAvatarImage{
    _avatarImage = anAvatarImage;
}
-(UIImage *)avatarImage{
    return _avatarImage;
}

-(UIImage*)avatarImageFromURL:(NSURL*)aURL{
    UIImage *temp = nil;
    /* get image from url */
    NSURLRequest *imgReq = [NSURLRequest requestWithURL:aURL];
    NSData *imgData = [NSURLConnection sendSynchronousRequest:imgReq returningResponse:nil error:nil];
    temp = [UIImage imageWithData:imgData];
    return temp;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Name: %@ \npointsCount: %d \navatarPicURL: %@\n", [self Name], [[self pointsCount] intValue], [self avatarPicURL] ];
}

@end
