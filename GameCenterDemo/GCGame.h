//
//  GCGame.h
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCGame : NSObject{
    NSString *Name;
    NSURL* gameIconURL;
    UIImage *gameIconImage;
}

@property NSString* Name;
@property NSURL *gameIconURL;
@property UIImage *gameIconImage;

-(void)setGameData:(NSDictionary*)aDictionary;
-(void)setName:(NSString*) aName;
-(NSString*)Name;
-(void)setGameIconURL:(NSURL*) aURL;
-(NSURL*)gameIconURL;
-(void)setGameIconImage:(UIImage*)anIconImage;
-(UIImage*)gameIconImage;
-(NSString *)description;
-(UIImage *)gameIconImageFromURL:(NSURL*)aURL;
@end
