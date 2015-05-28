//
//  AppDelegate.m
//  GameCenterDemo
//
//  Created by Tim Harris on 12/7/13.
//  Copyright (c) 2013 Tim Harris. All rights reserved.
//

#import "AppDelegate.h"
//#import "GCGame.h"
//#import "GCPost.h"

@implementation AppDelegate

//@synthesize postList=_postList, userPosts = _userPosts;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
   // _userPosts = [[NSMutableArray alloc]init];
    //[self getPosts];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/*
-(void)getPosts{
    NSString *postsURLString = @"http://localhost:8000/posts";
    NSURL * postsURL = [NSURL URLWithString:postsURLString];
    NSURLRequest *getPostsRequest =[NSURLRequest requestWithURL:postsURL];
    [NSURLConnection sendAsynchronousRequest:getPostsRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //NSString *dataString =[NSString stringWithUTF8String:[data bytes]];
       // NSLog(@"%@", dataString);
        _postList = [[NSMutableArray alloc]init];
        _postList = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       // NSLog(@"%@", _postList);

        for (NSDictionary *post in _postList) {
            
            //Creating objects for GCPost data structure
            GCPost *newPost = [[GCPost alloc]init];
            GCGame *newGame = [[GCGame alloc]init];
            GCUser *newUser = [[GCUser alloc]init];
            
            //Setting Message Post
            [newPost setPostMessage:[post objectForKey:@"postMessage"]];
            // Creating Dictionaries to access game and user data
            NSDictionary *gameDict = [[NSDictionary alloc]initWithDictionary:[post objectForKey:@"game"]];
            NSDictionary *userDict = [[NSDictionary alloc]initWithDictionary:[post objectForKey:@"user"]];
            
            [newGame setName:[gameDict objectForKey:@"name"]];
            [newGame setGameIconURL:[NSURL URLWithString:[gameDict objectForKey:@"iconURL"]]];
            
            [newUser setName:[userDict objectForKey:@"name"]];
            [newUser setPointsCount:[NSNumber numberWithInt:[[userDict objectForKey:@"pointsCount"] intValue]]];
            [newUser setAvatarPicURL:[NSURL URLWithString:[userDict objectForKey:@"avatarURL"]]];
            
            [newPost setGame:newGame];
            [newPost setUser:newUser];
           // NSLog(@"%@",[newPost description]);
            [_userPosts addObject:newPost];

        }
        for (GCPost *posts in _userPosts) {
            NSLog(@"%@",posts);

        }

    }];
}
*/

@end
