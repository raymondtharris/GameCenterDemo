//
//  GCGame.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "GCGame.h"

@implementation GCGame

@synthesize Name=_Name, gameIconURL=_gameIconURL, gameIconImage=_gameIconImage;

-(void)setGameData:(NSDictionary *)aDictionary{
    [self setName:[aDictionary valueForKey:@"Name"]];
    [self setGameIconURL:[aDictionary valueForKey:@"iconURL"]];
}
-(void)setName:(NSString *)aName{
    _Name = aName;
}
-(NSString *)Name{
    return _Name;
}
-(void)setGameIconURL:(NSURL *)aURL{
    _gameIconURL = aURL;
}
-(NSURL *)gameIconURL{
    return _gameIconURL;
}
-(void)setGameIconImage:(UIImage *)anIconImage{
    _gameIconImage = anIconImage;
}
-(UIImage *)gameIconImage{
    return _gameIconImage;
}

-(UIImage*)gameIconImageFromURL:(NSURL*)aURL{
    UIImage *temp = nil;
    /* get image from url */
    NSURLRequest *imgReq = [NSURLRequest requestWithURL:aURL];
    NSData *imgData = [NSURLConnection sendSynchronousRequest:imgReq returningResponse:nil error:nil];
    temp = [UIImage imageWithData:imgData];
    
    return temp;
}


-(NSString *)description{
    return [NSString stringWithFormat:@"Name: %@ \ngameIconURL: %@ \n", [self Name], [self gameIconURL]];
}

@end
